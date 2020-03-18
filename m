Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.45])
 by mx.groups.io with SMTP id smtpd.web10.13218.1584532946990966887
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Mar 2020 05:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=kLQEQobm;
 spf=pass (domain: arm.com, ip: 40.107.4.45, mailfrom: rahul.singh@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7T7a3F+MVMSwBV3KuYgMJZ7Q9wAZaB7kdSM5VKcam/Y=;
 b=kLQEQobmxiu32ptqWDm3ybt71ncoRoCKcXd2hl9HoQ+oq43bxFHTXjFbOOkkiOsjdN4xvHGRJdKCe9iCo5UzICwOd/orn9iXt870Bq9XFkJTmYIfb6loTYrlg5WccjEw/BANbN0TMw0pGRRw1GvkgfKKDl/24vFSu+kaRYMLEIE=
Received: from AM0PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:208:122::37)
 by VI1PR08MB4461.eurprd08.prod.outlook.com (2603:10a6:803:f5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.14; Wed, 18 Mar
 2020 12:02:24 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:122:cafe::8d) by AM0PR04CA0024.outlook.office365.com
 (2603:10a6:208:122::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.19 via Frontend
 Transport; Wed, 18 Mar 2020 12:02:24 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Wed, 18 Mar 2020 12:02:23 +0000
Received: ("Tessian outbound 1f9bda537fdc:v42"); Wed, 18 Mar 2020 12:02:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 686dee82728f8346
X-CR-MTA-TID: 64aa7808
Received: from f9bb0bf8fd01.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D19A7EB3-ACF2-47B9-BA95-854BC276A59D.1;
	Wed, 18 Mar 2020 12:02:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f9bb0bf8fd01.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 18 Mar 2020 12:02:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ib1WFnjgQzt1UpZ3Wb1QodbEZzxHYJOxaQ2fuT3WIqYqRe+tRjAzFHqTrm26sNBT+8XIBDm31FQNircbiRNwZGPd0ZcA01Z0cOGYVVGjSOWCWgfIUtGoVRi+J2BORyywC8rZKhRqI4nn52rxbyBz5b5Zuxqzn/PDzrrg8v92EMFHu2qxjn2EGJvh8Ez5ftn3gVFRNXbXLBCV8z+FEUInnB8kkrP3p4VWBAgI2fpA/IwqqOtpQdCJe4Lcbe6QCUV7Q4aVw9ViZIDTts0Q0GElzAc1PV7Hniqy+80cPF6F1HZnLoVqu2aSRSmgfVq6n+txYX5pSxhj76EvuHRBZZWPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7T7a3F+MVMSwBV3KuYgMJZ7Q9wAZaB7kdSM5VKcam/Y=;
 b=Pxjei6kODZBZyzySXVe1asPvT78HZtNs7eYPICRu6vhagq0tAAToDYdEVnEzhDZ+94tRRhyJE9ZXx6FC3kxpShwUPr5my7hEJaq77ugtgInCVF0tYvKVu+3IkOHALkghh+gxn55dFVEIwdt16F8S2UaHN4YbA7JHxMuKYcXdMhuBLH8+KsEHQdvAEaAbB1EhNDQaKGIjvDaWB0rSPAbUhmHKXwD2OTqiLIqNN3B5P5saUKMf3r9zLNYnpSGwWwCGH751GbIYrdJr7IRq5VajWeLw/kg21hkeNMEipSeakKzBhOj01JOrEvEc8EhBYKNIGfVjWAG7Jo+5Q6mRsHnbMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7T7a3F+MVMSwBV3KuYgMJZ7Q9wAZaB7kdSM5VKcam/Y=;
 b=kLQEQobmxiu32ptqWDm3ybt71ncoRoCKcXd2hl9HoQ+oq43bxFHTXjFbOOkkiOsjdN4xvHGRJdKCe9iCo5UzICwOd/orn9iXt870Bq9XFkJTmYIfb6loTYrlg5WccjEw/BANbN0TMw0pGRRw1GvkgfKKDl/24vFSu+kaRYMLEIE=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Rahul.Singh@arm.com; 
Received: from DBBPR08MB5547.eurprd08.prod.outlook.com (20.179.44.150) by
 DBBPR08MB4281.eurprd08.prod.outlook.com (20.179.41.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.19; Wed, 18 Mar 2020 12:02:17 +0000
Received: from DBBPR08MB5547.eurprd08.prod.outlook.com
 ([fe80::1490:577c:4c1d:b5fa]) by DBBPR08MB5547.eurprd08.prod.outlook.com
 ([fe80::1490:577c:4c1d:b5fa%3]) with mapi id 15.20.2814.021; Wed, 18 Mar 2020
 12:02:17 +0000
From: "Rahul Singh" <rahul.singh@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] foundation: disable Scalable Vector Extension (SVE)
Date: Wed, 18 Mar 2020 12:01:46 +0000
Message-Id: <20200318120146.24154-1-rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: PN1PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:1::28) To DBBPR08MB5547.eurprd08.prod.outlook.com
 (2603:10a6:10:d2::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.49) by PN1PR01CA0088.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.19 via Frontend Transport; Wed, 18 Mar 2020 12:02:15 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.49]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eaf3effd-93f4-4ef3-2b31-08d7cb34382f
X-MS-TrafficTypeDiagnostic: DBBPR08MB4281:|VI1PR08MB4461:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB4461222A31E60652CF8D4641FCF70@VI1PR08MB4461.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-Forefront-PRVS: 03468CBA43
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(199004)(6666004)(26005)(186003)(36756003)(5660300002)(86362001)(8936002)(16526019)(956004)(6916009)(2616005)(66476007)(66556008)(66946007)(2906002)(478600001)(316002)(4326008)(52116002)(1076003)(7696005)(44832011)(81156014)(8676002)(81166006)(6486002);DIR:OUT;SFP:1101;SCL:1;SRVR:DBBPR08MB4281;H:DBBPR08MB5547.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Ozffs91sD8QJ3dERd/O3Xy30luvClGmkXmWZ1nIu/WArO65zr5Rn3WvA5DsCmwI+5C5Q+OAAhLIfHoyUzfHPxvVaIUW6O8nPIaZ50As7FfuE4Jvkk6TSAjhL3Cyzhd5p+rtcPMb2C/dYdGa4mJ+F+Z6opM9VkLqkpvDoOY59mPqAYhiG3B6Exe1nPdUDYWzXyUBEiK8S3tFF88/gs6gJyisouf77WEj4gLFArzTV3jtF3MwxRRNBb2rOW/ebmx9dR6Yr9B+vvanZna/lfoS7+/7tZzSyjJONHvBGOpTrVFqOGT3tQnh3iRhToniZjdT7akNPWheFf0+80LMYz0WBfFjjIASmMJTr63xP98ipZMtya0LqQyWIu9hW49D6M6gLTSIfiICzd3c2alT3lstcUMTdOcdMB64c9v6BvAXbUHQI77uKp8kuZAM+YuNP551E
X-MS-Exchange-AntiSpam-MessageData: 
 xkbK9Q1PEJeE1wzjOVSylGEfUJwUEBXEzF5zNylzj9vgK1kge3Qy3RY4VmPIy5EBm7ndFd/6h4VGsgqZzg/F7I8nVQEXeLC+kI+Q+px/AExXrUSjYSmPPg13bQQb6iv2UZITkrSMqbFrMdgrb+UlUQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4281
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rahul.Singh@arm.com; 
Return-Path: Rahul.Singh@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(199004)(46966005)(4326008)(8936002)(16526019)(36906005)(81166006)(8676002)(336012)(2906002)(86362001)(81156014)(186003)(26005)(316002)(47076004)(2616005)(44832011)(956004)(6916009)(356004)(6666004)(1076003)(36756003)(26826003)(6486002)(70206006)(478600001)(5660300002)(70586007)(7696005);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB4461;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	18d57894-10a6-48e7-dbcf-08d7cb3433f1
X-Forefront-PRVS: 03468CBA43
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hg3CCYLAQULlntSD6erM2d3FnlDIWvvqspGpqyT7y3R+zSJ5Wtix0quuUw6VCPrINoRax6faiOM8L2nJVaHtIn3sIxe5qNshjNmCx9005P+warxRqtanMqf7OHyUT/CAyRNPEIhKteYL85UxYT095OJG5bqdgNoc9RImRbrUbLBSbcJA5T9qDdmHOqhsZJZCoTjswe/U1uvq8L7ZH9XCNoZOZ4mJ5sNxh1m3XupFXVymuhGBsWDuhSj5wMSDphi1HjvCiT1/bUuRTSnP3m1JGIpfzZ976B/HTFZ251yxzQ0u/tCYqDXOWBYiZ22ty07x+ApthW75lWk5vQA1olTjQbaYXlkW/jytKab/eOm8Djmk6YcbVNIhCAAtPKGeT3r1Ld3TXZn1AehhkNw6lU7YJALw4vQ4rkgOtwFus7jnYA1jPQccsrFrO8450LG9BtoRzbRnwViP10XOOSCOugDCDfZmdaqDAIoUfQa4pcmzgA3xRsN/1G7ZlW8puwXael54LwPU76Y2mHIAKPXQqJZpVQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2020 12:02:23.6526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf3effd-93f4-4ef3-2b31-08d7cb34382f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4461
Content-Type: text/plain

When foundation platform is booted with SVE enabled in linux
kernel and with Xen hypervisor, linux kernel is stopped by a
trap catched by Xen during early boot as Xen is configuring
the coprocessor to trap access to SVE to EL2.Disabling the SVE
in foundation to boot the guest and host.

Change-Id: I862540a46686f1fb5343a3143da61db6073bb1d3
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 .../recipes-devtools/fvp-common/files/start-foundation-armv8.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
index 1df4fd8..e014124 100755
--- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
+++ b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
@@ -41,9 +41,11 @@ FOUNDATION_PLAT_EXE="Foundation_Platform"
 
 # Foundation Platform arguments
 # 4 cores
+# Disable Scalable Vector Extension (SVE)
 # gicv3 emulation (required for hardware virtualisation)
 FOUNDATION_PLAT_ARGS=" \
     --cores=4 \
+    --no-sve \
     --gicv3"
 
 # Foundation Platform user arguments
-- 
2.17.1

