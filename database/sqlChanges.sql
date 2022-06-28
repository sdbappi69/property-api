-- AddStatusCoulumnToLandlordsTable:
    alter table `landlords` add `status` tinyint not null default '1' comment '0=Inactive,1=Active' after `confirmed`
-- AddStatusCoulumnToPropertiesTable:
    alter table `properties` add `status` tinyint not null default '1' comment '0=Inactive,1=Active' after `zip`
-- AddStatusCoulumnToTenantsTable:
    alter table `tenants` add `status` tinyint not null default '1' comment '0=Inactive,1=Active' after `confirmed`
-- AddStatusCoulumnToLeasesTable:
    alter table `leases` add `status` tinyint not null default '1' comment '0=Inactive,1=Active' after `show_payment_method_on_invoice`
-- AddStatusCoulumnToUtilitiesTable:
    alter table `utilities` add `status` tinyint not null default '1' comment '0=Inactive,1=Active' after `utility_description`
