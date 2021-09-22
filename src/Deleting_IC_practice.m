% This script is created to practice deleting IC components after doing ICA.
% It plots the scalpmaps of the manual delete components as well as the auto deleted ones.
% Threshold for auto deletion of components decided after comparing how ICA experts
% in our lab have been doing this for years manually.
% Deleting IC components requires a lot of knowledge and practice and has a huge impact on the data.
% For explanation about why a components is bad, or what to look for, consult with an expert.
%
%
%
% This script requires eeglab and IClabel (eeglab toolbox)
% Created on 9/22/2021 by Douwe Horsthuis, CNL

%clear variables
%eeglab
home_path  = '\\data.einsteinmed.org\users\CNL Lab\Analysis\ICA_test\Data\'; %where the data is stored
subject_list = {'2201' '2204' '2207' '2208' '7003' '7007' '7073' '7074' '7808' '7123' '10092' '10130' '10476' '10590' '10748' '12005' '12449' '12482' '12648'};
save_path = 'C:\Users\dohorsth\Documents\GitHub\ICA_Practice\testing\'; %where to save the figures
eye_percentage= 0.70; %what is the minimum size for the eye component's eye (70% is what matched with the experts in our lab)
components =num2cell(zeros(length(subject_list),3));
auto_components.id=num2cell(zeros(length(subject_list),1));
auto_components.eyecomponents=num2cell(zeros(1,length(subject_list)));
auto_components.other_no_eye= num2cell(zeros(1,length(subject_list)));
prompt = 'Do you want to look at eye components only [y/n]? ';
type = input(prompt, 's');
if strcmp(type, 'n') || strcmp(type, 'No') || strcmp(type, 'no') || strcmp(type, 'NO')
    type = 'N';
end

for s=1:length(subject_list)
    data_path  = [home_path subject_list{s} ''];% Path to the folder containing the current subject's data
    % Load original dataset
    fprintf('\n\n\n**** %s: Loading dataset ****\n\n\n', subject_list{s});
    EEG = pop_loadset('filename', [subject_list{s} '_iclabel.set'], 'filepath', data_path);
    %adding info for the auto deleted part
    auto_components.id(s,1)= subject_list(s);
    auto_components.ic_components(s,1).iclabel = [EEG.etc.ic_classification.ICLabel.classifications, sum(EEG.etc.ic_classification.ICLabel.classifications(:,[2 4 5 6]),2), sum(EEG.etc.ic_classification.ICLabel.classifications(:,[2 3 4 5 6]),2)];
    %eye components
    auto_components.eyecomponents{1,s}= find(auto_components.ic_components(s,1).iclabel(:,3)>(eye_percentage) & auto_components.ic_components(s,1).iclabel(:,1)<0.10);
    %remaining noise components (set to 80%, can be changed in line below)
    auto_components.other_no_eye{1,s}= find(auto_components.ic_components(s,1).iclabel(:,8)>(0.80) & auto_components.ic_components(s,1).iclabel(:,1)<0.10); %first 5 are 5% brain
    pop_selectcomps(EEG, 1:EEG.nbchan);
    %Promting what components to delete
    prompt = 'Eye components? If yes, input the numbers in [ ]. for example [1 2 10] ';
    eye_components = input(prompt);
    close all
    if strcmp(type, 'N') 
        pop_selectcomps(EEG, 1:EEG.nbchan);
        prompt = 'Are there other components you would delete? If yes, input the numbers in [ ]. for example [1 2 10] ';
        other_components = input(prompt);
        
        %% noise except eye part
        %is going to create a topoplot and save it
        if isempty(other_components)
            figure;title(subject_list{s}); text( 0.2,0.5, 'there are no "other" components manually selected')
            other_components = 0;
        elseif length(other_components) == 1
            figure;pop_topoplot(EEG ,0, other_components, subject_list{s},[1 1] ,0,'electrodes','on');
        else
            pop_topoplot(EEG, 0, other_components ,subject_list{s},[ceil(sqrt(length(other_components))) ceil(sqrt(length(other_components)))] ,0,'electrodes','on');
        end
        title(subject_list{s});
        %saving figure
        print([save_path '\' subject_list{s} '_other_bad_ICs_topos_manual'], '-dpng' ,'-r300');
        
        if auto_components.other_no_eye{1, s}==0
            figure;title(subject_list{s}); text( 0.2,0.5, 'there are no "other" components auto selected')
        elseif length(auto_components.other_no_eye{1, s}) == 1
            figure;pop_topoplot(EEG ,0, auto_components.other_no_eye{1, s}, subject_list{s},[1 1] ,0,'electrodes','on');
        else
            pop_topoplot(EEG, 0, auto_components.other_no_eye{1, s} ,subject_list{s},[ceil(sqrt(length(auto_components.other_no_eye{1, s}))) ceil(sqrt(length(auto_components.other_no_eye{1, s})))] ,0,'electrodes','on');
        end
        title(subject_list{s});
        %saving figure
        print([save_path '\' subject_list{s} '_other_bad_ICs_topos_auto'], '-dpng' ,'-r300');
        %combining both figures and deleting the separate ones
        figure('units','normalized','outerposition',[0 0 1 1])
        subplot(1,2,1);
        imshow([save_path subject_list{s} '_other_bad_ICs_topos_manual.png']);
        title('Manual')
        subplot(1,2,2);
        imshow([save_path subject_list{s} '_other_bad_ICs_topos_auto.png']);
        title('Auto')
        print([save_path subject_list{s} '_deleted_noise_components'], '-dpng' ,'-r300');
        %deleting two original files
        delete([save_path subject_list{s} '_other_bad_ICs_topos_manual.png'])
        delete([save_path subject_list{s} '_other_bad_ICs_topos_auto.png'])
        close all
    end
    %% eye part
    if isempty(eye_components)
        figure;title(subject_list{s}); text( 0.2,0.5, 'there are no eye-components manually selected')
        eye_components = 0;
    elseif length(eye_components) == 1
        figure;pop_topoplot(EEG ,0, eye_components, subject_list{s},[1 1] ,0,'electrodes','on');
    else
        pop_topoplot(EEG, 0, eye_components ,subject_list{s},[ceil(sqrt(length(eye_components))) ceil(sqrt(length(eye_components)))] ,0,'electrodes','on');
    end
    title(subject_list{s});
    %saving figure
    print([save_path '\' subject_list{s} '_Eye_ICs_manual'], '-dpng', '-r300');
    %auto
    if auto_components.eyecomponents{1, s}==0
        figure;title(subject_list{s}); text( 0.2,0.5, 'there are no eye components auto selected')
    elseif length(auto_components.eyecomponents{1, s}) == 1
        figure;pop_topoplot(EEG ,0, auto_components.eyecomponents{1, s}, subject_list{s},[1 1] ,0,'electrodes','on');
    else
        pop_topoplot(EEG, 0, auto_components.eyecomponents{1, s} ,subject_list{s},[ceil(sqrt(length(auto_components.eyecomponents{1, s}))) ceil(sqrt(length(auto_components.eyecomponents{1, s})))] ,0,'electrodes','on');
    end
    title(subject_list{s});
    %saving figure
    print([save_path '\' subject_list{s} '_Eye_ICs_auto'], '-dpng' ,'-r300');
    %combining both figures and deleting the separate ones
    figure('units','normalized','outerposition',[0 0 1 1])
    subplot(1,2,1);
    imshow([save_path subject_list{s} '_Eye_ICs_manual.png']);
    title('Manual')
    subplot(1,2,2);
    imshow([save_path subject_list{s} '_Eye_ICs_auto.png']);
    title('Auto')
    print([save_path subject_list{s} '_deleted_eye_components'], '-dpng' ,'-r300');
    %deleting two original files
    delete([save_path subject_list{s} '_Eye_ICs_manual.png'])
    delete([save_path subject_list{s} '_Eye_ICs_auto.png'])
    close all
end

