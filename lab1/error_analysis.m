% Section 4 - Error Analysis
% generate confusion matrices for each classifier

%% Generate Test Set for NN and KNN to classify
[~, test_pts_A, ~] = generate_clusters(N_A, mu_A, sigma_A);
[~, test_pts_B, ~] = generate_clusters(N_B, mu_B, sigma_B);
[~, test_pts_C, ~] = generate_clusters(N_C, mu_C, sigma_C);
[~, test_pts_D, ~] = generate_clusters(N_D, mu_D, sigma_D);
[~, test_pts_E, ~] = generate_clusters(N_E, mu_E, sigma_E);

c1_test_pts = vertcat(test_pts_A, test_pts_B);
c1_test_classes = [ones(1, size(test_pts_A, 1)) 2*ones(1, size(test_pts_B, 1))];

c1_pts = vertcat(transformed_pts_A, transformed_pts_B);
c1_pts_classes = [ones(1, size(pts_A, 1)) 2*ones(1, size(pts_B, 1))];

c2_test_pts = vertcat(test_pts_C, test_pts_D, test_pts_E);
c2_test_classes = [ones(1, size(test_pts_C, 1)) 2*ones(1, size(test_pts_D, 1)) 3*ones(1,size(test_pts_E, 1))];

c2_pts = vertcat(transformed_pts_C, transformed_pts_D, transformed_pts_E);
c2_pts_classes = [ones(1, size(pts_C, 1)) 2*ones(1, size(pts_D, 1)) 3*ones(1,size(pts_E, 1))];

%% MED confusion matrix
if case_number == 1
    predicted_med_labels = test_classify(c1_test_pts, @MED, ...
        [mu_A mu_B], 0, 0);
    med_c = confusionmat(c1_test_classes, predicted_med_labels);
    figure;
    confusionchart(med_c, {'Class A','Class B'});
    title('Case 1: MED confusion matrix for Class A and B');
elseif case_number == 2
    predicted_med_labels = test_classify(c2_test_pts, @MED, ...
        [mu_C mu_D mu_E], 0, 0);
    med_c = confusionmat(c2_test_classes, predicted_med_labels);
    figure;
    confusionchart(med_c, {'Class C','Class D','Class E'});
    title('Case 2: MED confusion matrix for Class C, D, and E');
end

%% GED confusion matrix
if case_number == 1
    predicted_ged_labels = test_classify(c1_test_pts, @GED, ...
        [mu_A mu_B], [sigma_A sigma_B], 0);
    ged_c = confusionmat(c1_test_classes, predicted_ged_labels);
    figure;
    confusionchart(ged_c,{'Class A','Class B'});
    title('Case 1: GED/MICD confusion matrix for Class A and B');
elseif case_number == 2
    predicted_ged_labels = test_classify(c2_test_pts, @GED, ...
        [mu_C mu_D mu_E], [sigma_C sigma_D sigma_E], 0);
    ged_c = confusionmat(c2_test_classes, predicted_ged_labels);
    figure;
    confusionchart(ged_c,{'Class C','Class D','Class E'});
    title('Case 2: GED/MICD confusion matrix for Class C, D, and E');
end

%% MAP confusion matrix
if case_number == 1
    predicted_map_labels = test_classify(c1_test_pts, @MAP, ...
        [mu_A mu_B], [sigma_A sigma_B], [prior_A prior_B]);
    map_c = confusionmat(c1_test_classes, predicted_map_labels);
    figure;
    confusionchart(map_c,{'Class A','Class B'});
    title('Case 1: MAP confusion matrix for Class A and B');
elseif case_number == 2
    predicted_map_labels = test_classify(c2_test_pts, @MAP, ...
        [mu_C mu_D mu_E], [sigma_C sigma_D sigma_E], [prior_C prior_D prior_E]);
    map_c = confusionmat(c2_test_classes, predicted_map_labels);
    figure;
    confusionchart(map_c,{'Class C','Class D','Class E'});
    title('Case 2: MAP confusion matrix for Class C, D, and E');
end

%% NN confusion matrix
if case_number == 1
    predicted_nn_labels = test_classify(c1_test_pts, @NN, c1_pts, ...
        c1_pts_classes, 0);
    nn_c = confusionmat(c1_test_classes, predicted_nn_labels);
    figure;
    confusionchart(nn_c,{'Class A','Class B'});
    title('Case 1: NN confusion matrix for Class A and B');
elseif case_number == 2
    predicted_nn_labels = test_classify(c2_test_pts, @NN, c2_pts, ...
        c2_pts_classes, 0);
    nn_c = confusionmat(c2_test_classes, predicted_nn_labels);
    figure;
    confusionchart(nn_c,{'Class C','Class D','Class E'});
    title('Case 2: NN confusion matrix for Class C, D, and E');
end

%% KNN confusion matrix
if case_number == 1
    predicted_knn_labels = test_classify(c1_test_pts, @KNN, c1_pts, ...
        c1_pts_classes, 0);
    knn_c = confusionmat(c1_test_classes, predicted_knn_labels);
    figure;
    confusionchart(knn_c,{'Class A','Class B'});
    title('Case 1: KNN confusion matrix for Class A and B');
elseif case_number == 2
    predicted_knn_labels = test_classify(c2_test_pts, @KNN, c2_pts, ...
        c2_pts_classes, 0);
    knn_c = confusionmat(c2_test_classes, predicted_knn_labels);
    figure;
    confusionchart(knn_c,{'Class C','Class D','Class E'});
    title('Case 2: KNN confusion matrix for Class C, D, and E');
end

%% 4.1 Calculate and Display Experimental Error Rate
names = categorical({'MED', 'GED', 'MAP', ' NN', 'KNN'});
names = reordercats(names,{'MED', 'GED', 'MAP', ' NN', 'KNN'});
p_es = [get_p_e(med_c) get_p_e(ged_c) get_p_e(map_c) get_p_e(nn_c) get_p_e(knn_c)];
figure;
bar(names, p_es)
if case_number == 1
    title('Case 1: P(\epsilon) Values for All Classifiers');
elseif case_number == 2
    title('Case 2: P(\epsilon) Values for All Classifiers');
end
ylabel('P(\epsilon)');
xlabel('Classifier');