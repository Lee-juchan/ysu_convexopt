% get_DVH_PTV (annotated)
function [ cum_DVH ] = get_DVH_PTV(beam_kernel, beam_intensity, binwidth)

    % dose
    dose = beam_kernel*beam_intensity(:);

    % differential DVH
    bins = [0:binwidth:100];
    diff_DVH = hist(dose, bins);

    % cumulative DVH
    cum_DVH = fliplr(cumsum(fliplr(diff_DVH)));
    cum_DVH = cum_DVH/max(cum_DVH); % normalize
end

% function [ DVH_PTV ] = get_DVH_PTV(PTV,x_beam)

%     PTV_dummy = PTV*x_beam(:);

%     x_ax= 0:0.1:100;

%     Dummy_t = hist(PTV_dummy,x_ax);
%     DVH_t = fliplr(cumsum(fliplr(Dummy_t)));
%     DVH_PTV = DVH_t/max(DVH_t);

%     % if sig==1
%     %     figure(1);
%     %     plot(x_perc,DVH_t); hold on;
%     %     xlim([0 100])
%     %     grid on; hold off;
%     %     legend('PTV') %'OAR5'); %,'OAR6'); %,'Tuning');

% end