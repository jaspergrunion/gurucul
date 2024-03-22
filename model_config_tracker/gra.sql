CREATE TABLE analytical_models (id int, anomaly_name varchar(255), classifier_group varchar(255), template_id int, category varchar(255), enabled int);

INSERT INTO analytical_models (id, anomaly_name, classifier_group, template_id, category, enabled) VALUES (282, "Sysmon-Entity-Uninstall Crowdstrike Falcon", "ENTITY", 130, "Pattern Analysis", 1);
INSERT INTO analytical_models (id, anomaly_name, classifier_group, template_id, category, enabled) VALUES (123, "Super Model", "ENTITY", 59, "Pattern Analysis", 0);
INSERT INTO analytical_models (id, anomaly_name, classifier_group, template_id, category, enabled) VALUES (895, "Super Model 2", "ENTITY", 28, "Pattern Analysis", 1);
INSERT INTO analytical_models (id, anomaly_name, classifier_group, template_id, category, enabled) VALUES (999, "Super Model 3", "ENTITY", 39, "Frequency Analysis", 1);
INSERT INTO analytical_models (id, anomaly_name, classifier_group, template_id, category, enabled) VALUES (999, "Super Model 4", "ENTITY", 39, "Frequency Analysis", 1);
INSERT INTO analytical_models (id, anomaly_name, classifier_group, template_id, category, enabled) VALUES (999, "Super Model 5", "ENTITY", 39, "Frequency Analysis", 1);
