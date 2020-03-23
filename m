Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.80])
 by mx.groups.io with SMTP id smtpd.web12.53534.1584973327798709535
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Mar 2020 07:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Qs+B2yZy;
 spf=pass (domain: arm.com, ip: 40.107.20.80, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4j60EsOvtmk6ZPbkfX9IJ9hi357SVc0lnrI2kwV+9c=;
 b=Qs+B2yZyrikJ9m+ilH0AXWBOo3FtXUnYT4UsSl4ltUXJL7zmG6gzakJ/Mu5mqo/XC5/AQGgea0AXFvc/K+trcrZezxZtuNcSXaJAfV/I2RAl0kjXsDfsmv+RAHpdeZVAHp4Y3ZrCG7LXjNUAfqcRVF+JCwaxtrFVacQNHgGt/60=
Received: from AM3PR05CA0107.eurprd05.prod.outlook.com (2603:10a6:207:1::33)
 by DB7PR08MB3131.eurprd08.prod.outlook.com (2603:10a6:5:1e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Mon, 23 Mar
 2020 14:22:04 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:1:cafe::31) by AM3PR05CA0107.outlook.office365.com
 (2603:10a6:207:1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15 via Frontend
 Transport; Mon, 23 Mar 2020 14:22:04 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Mon, 23 Mar 2020 14:22:04 +0000
Received: ("Tessian outbound 2fd788417c13:v48"); Mon, 23 Mar 2020 14:22:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a918d3f242bd02f2
X-CR-MTA-TID: 64aa7808
Received: from 4293eacd5d33.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 115448BA-46E3-490E-A674-C1BB3C1333F3.1;
	Mon, 23 Mar 2020 14:21:59 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4293eacd5d33.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 Mar 2020 14:21:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTCsHO0S1zFpgCq7jJC5KJJWmW+vQJiKFJs68iaQjHuPdGa3WKn12ce77q+XC+zTl7GHQttEVw8ZuvoXDSQoqGUJ+J1Li8dACDYxsWnz5MvhYexu2s2ovnPm02qP0M8pRrSubHNvcAg1afdkicbjlgyRPRO4BDSeaYuWeWy7pp3614evJNw7qCryU0i2JFWsf9Alnjbw9SSu2GdWcacVUENM7K2tPcTVw3PPkooJCuWIwTN/ujyNC/ZX9ZWhSSC3Zd/H7iZ2DizPYdRK773K25YSflK/6r9vg5clI5mO0A0UWjJk9k/91UF0rmLKCr551tgJLle6TbNNDHE24bavNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4j60EsOvtmk6ZPbkfX9IJ9hi357SVc0lnrI2kwV+9c=;
 b=TJOzNP1ogd+dI/dhzuaDquvIUcpX22oE+EYctj4Rwi09JrTGKYqwak4HdFD7DJoqDdwWqgXQ8fGHSU53f3s6E7CYduUOyB4Bax9uC4dN5HNysviIdnTkBUjbCLodEp5osg+0xESrx7ITIETv/uuyNrgVUvjKq1oqT7LxHCd996YB327L6axZS2oQA/QqX+YJR1SzpGUMhnUdj2ExtRFb0mSzYYKhqyXPrax3Hizuw4xHGjxhox+fCMEATZmJXNZVLJ8+JO0XhmeMvLaHDR7YXo+jvxpN1L0TldSYfyVkFan8s68UYaELMPy0Eh79++zRT1OQdCZQAMWxI0sJ5rLvZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4j60EsOvtmk6ZPbkfX9IJ9hi357SVc0lnrI2kwV+9c=;
 b=Qs+B2yZyrikJ9m+ilH0AXWBOo3FtXUnYT4UsSl4ltUXJL7zmG6gzakJ/Mu5mqo/XC5/AQGgea0AXFvc/K+trcrZezxZtuNcSXaJAfV/I2RAl0kjXsDfsmv+RAHpdeZVAHp4Y3ZrCG7LXjNUAfqcRVF+JCwaxtrFVacQNHgGt/60=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Jon.Mason@arm.com; 
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (20.178.118.32) by
 AM0PR08MB3458.eurprd08.prod.outlook.com (20.177.43.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Mon, 23 Mar 2020 14:21:58 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::11a8:d2c1:e055:a7d5]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::11a8:d2c1:e055:a7d5%6]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 14:21:58 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] meta-arm-bsp: add layer dependencies
Date: Mon, 23 Mar 2020 10:21:46 -0400
Message-Id: <20200323142146.30350-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323142146.30350-1-jon.mason@arm.com>
References: <20200323142146.30350-1-jon.mason@arm.com>
X-ClientProxiedBy: BL0PR0102CA0001.prod.exchangelabs.com
 (2603:10b6:207:18::14) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by BL0PR0102CA0001.prod.exchangelabs.com (2603:10b6:207:18::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15 via Frontend Transport; Mon, 23 Mar 2020 14:21:56 +0000
Received: by vm (sSMTP sendmail emulation); Mon, 23 Mar 2020 10:21:52 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7cbd2143-ffb5-4aa9-233f-08d7cf358f95
X-MS-TrafficTypeDiagnostic: AM0PR08MB3458:|DB7PR08MB3131:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB31318597EFD5386419710AAAF0F00@DB7PR08MB3131.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;OLM:4502;
X-Forefront-PRVS: 0351D213B3
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(199004)(186003)(2616005)(6666004)(478600001)(44832011)(4326008)(1076003)(26005)(426003)(5660300002)(8936002)(66476007)(2906002)(81156014)(36756003)(8676002)(81166006)(86362001)(66946007)(66556008)(6916009)(42186006)(316002)(52116002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR08MB3458;H:AM0PR08MB3972.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 l40CyJQC6aCcdJ34XIJvNwVUeZ0E9X8VgQuWT9ZpmqDitj5nDnZ/PP77D+zjC+J38alQbC3Uk9+fohpfSP0iR+jeOhOhgQmMm/skfqi8DTtFmzTm1iap2cM1Z1qvVnaWKGSWP8O4Vnx8vrzTLPWYn1v6JiL+b/UfykatgcT22JE5PxxE8qpdomLe6OillVP2/2kDmDJVpScFl5Zq7r/fojAO+qDEE8dbqigamdK1DeBWzOG//6tjV+Isva18Bf4j+FtfPXFx0kBPWOFOLdSaby4uj/tL3x6PDEAuSV51RL76eFmlxo5IsE5vl3NesX4MX+1Z7PpWOt3Y+/yc7PU1pdpMfS7MqHBPhmjgsWIaxE+yc/wxTy0I97PSblQe0pZu7x1aPUUeTCjRUGNMJjSiDF+lNZDHmcGHcctDszGVCBQJqxwWqPbrAIfCKghMCp0V
X-MS-Exchange-AntiSpam-MessageData: 
 rtiMbx5vSoZTvQCtz78iKq9362aPsY6Ti7m0EKFp+4O2n9N6A8+1uhfsGDPyTO6BE3WxGDWdiRd8WU6WWIfa7u5t8jgPJVGNxISfHRMVDAEzXUwSWRm1IU7vYH9jW9h3bztxNMNHJR+Vmijva1YX0A==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3458
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jon.Mason@arm.com; 
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(199004)(46966005)(36756003)(81166006)(26826003)(8676002)(81156014)(2906002)(8936002)(36906005)(47076004)(42186006)(316002)(70206006)(6916009)(86362001)(70586007)(6666004)(186003)(356004)(2616005)(44832011)(4326008)(426003)(336012)(1076003)(26005)(478600001)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR08MB3131;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d13cacf2-e59a-4766-84ba-08d7cf358b24
X-Forefront-PRVS: 0351D213B3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BkB9C+PIYp+8n0PSHJiJz8H2XfSrEXiC88Fy0zcUsnzMuoCt7mN3nuwkwvv25OUCpyC4HwxlL48P7DeqrArLT4KICEaOI/hBJ6Wx9ebjCyrM6Q17FTNkRsgkH+gOlpwH8pYRlSGsQngXOoYwc9lwfbB0YJo8PVIgHRvLKph+M2He6YCYVkCxrIPnqh69Z1S58HZenZaM4YFWEf5dchGTMjSZaHEzweRt7lfAnrQvWoMqoIGJ6r+0lSui82wgIK7LX6ZzHie706q8Tx6iNUP3+eqv3cdTvnt/Wu3ogI3B4GrzBc3DEQQ4Ss1WRdnPfTlsm7I84MuGElmaErZi+pMTw18Nd9sDopEuoQpjQ0HQeCLPgwIdcg5qYWsuFkM6CxEVMnqio6ViAQGi5/vzsbp4MCYssS1zWMUyy/1AD3m7irdLqhTgSQH2daXwKGMS9ShHzFgAscYvkpOI5x0msj1SEyhZ9IgEyP9xJC9J8iMzcz8q7S8dPwCe/g5eIQ60a3C4VC6tnHQdbeiao0thLX+JVg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2020 14:22:04.4736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cbd2143-ffb5-4aa9-233f-08d7cf358f95
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3131
Content-Type: text/plain

meta-arm-bsp has dependencies on other layers, which are not being
represented in the layers.conf file.  This causes build breaks when
using tools like `bitbake-layers layerindex-fetch`, as it will not fetch
the depencies properly.  Currently, the dependencies on other layers are:
* core => u-boot, linux, etc
* openembedded-layer (meta-oe) => haveged
* meta-arm => trusted-firmware-a

Change-Id: Icafc2f1c55a6138172706bb4b99e9dc59904cad4
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 931b54c..0632ba3 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp = "6"
 
-LAYERDEPENDS_meta-arm-bsp = "core"
+LAYERDEPENDS_meta-arm-bsp = "core openembedded-layer meta-arm"
 LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus"
 
 # We have patches for xen but meta-virtualization might not be there so filter
-- 
2.17.1

