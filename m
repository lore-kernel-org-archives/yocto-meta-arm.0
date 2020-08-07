Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.74])
 by mx.groups.io with SMTP id smtpd.web10.4220.1596829415616184448
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 12:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=UzX4YBe4;
 spf=pass (domain: arm.com, ip: 40.107.6.74, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNg3AqTv4bAmnpIYJ/yr6o993Quq8Yjzo+nVIbXzeL8=;
 b=UzX4YBe4cuQyHSTYOagBHQF5XJAE8o8P6OKjCznpS+TO9iXJC6z36dI3DKkGitX3id5cjspWAiETd0SZFT3Lz98ezPNcKsXTa23Fx0CI2ibG2tr2b53dXrsU4b57lfbbfWLE7EZKRa+/3rbiDG51qPy9La+ZrjR0uPWQFCPHJ1c=
Received: from DB6PR0301CA0075.eurprd03.prod.outlook.com (2603:10a6:6:30::22)
 by DB6PR0801MB1734.eurprd08.prod.outlook.com (2603:10a6:4:31::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 19:43:33 +0000
Received: from DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30::4) by DB6PR0301CA0075.outlook.office365.com
 (2603:10a6:6:30::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend
 Transport; Fri, 7 Aug 2020 19:43:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT038.mail.protection.outlook.com (10.152.21.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 19:43:33 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Fri, 07 Aug 2020 19:43:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7a6eb28cfad607ac
X-CR-MTA-TID: 64aa7808
Received: from 998bfb8612cd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B345952A-2790-48D4-995C-61DF3CBF73ED.1;
	Fri, 07 Aug 2020 19:43:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 998bfb8612cd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 19:43:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7fKnIksgLInjyo6pJsi+5thT2DfEbAFiVfOuWzWffciPnE2eUQIDn+hxOoEe8zyFjl2vKG37HOTnX/L5isZx8ISkZit93ntIovOGltfGbFDRUQul9/UYZwopx4IabUPN0NwPD94HnSiZ2T27uO9DDMi8N63tOAlzvuA9WfnYHAfF604cFq0ls3HNd7YpLvtt7FolcPzBOIQFvybZ3cC68crucY3HiyCMtNDhFHN8/xomLWSoo0dCh4TjrZUVx+fR8vNXBHzcpBSuJQicxbhMWtYwLZBby5nu4yalanG+mv9AbwexIxszApQqLksinwsuYJvrHSW0hXjPmaRqSmwMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNg3AqTv4bAmnpIYJ/yr6o993Quq8Yjzo+nVIbXzeL8=;
 b=kwtAWMyVBKq9Ik7v7lMsaVO8R+ZIofiAbPtLvF31/BgYA99aO3+HVPsYfl1tSzXNFCwMOZXwa8HmbLdOdRBya+WGoNcjFr05rJFoWjfxVCLNENrX9EeO+ROBH3aCvhXCrwxOyizQ5cSjPpNBAuxVgHRxuOQtt6DD/3agosb3iwJgvcxbpn0HCisEjhwd/9p+3F4piXfXINwjRdvvAP2wgiJRptLq1ZJ7h/TPqF4P/S3f9xBH6rLoUMXIvJnnsBnpyjXZLWJZzpe2qZ4cNFlysQ01EGx8bWa86RnsLTCXnA12AbB5YBZ07eQUNqWT2KslcA/uzWftR7uld8eY5nbOQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNg3AqTv4bAmnpIYJ/yr6o993Quq8Yjzo+nVIbXzeL8=;
 b=UzX4YBe4cuQyHSTYOagBHQF5XJAE8o8P6OKjCznpS+TO9iXJC6z36dI3DKkGitX3id5cjspWAiETd0SZFT3Lz98ezPNcKsXTa23Fx0CI2ibG2tr2b53dXrsU4b57lfbbfWLE7EZKRa+/3rbiDG51qPy9La+ZrjR0uPWQFCPHJ1c=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM6PR08MB4868.eurprd08.prod.outlook.com (2603:10a6:20b:c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 19:43:26 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 19:43:26 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 8/9] arm-bsp/machine: adding corstone700-mps3 machine
Date: Fri,  7 Aug 2020 20:42:52 +0100
Message-Id: <20200807194253.14748-9-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
References: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN6PR2101CA0013.namprd21.prod.outlook.com
 (2603:10b6:805:106::23) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN6PR2101CA0013.namprd21.prod.outlook.com (2603:10b6:805:106::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.2 via Frontend Transport; Fri, 7 Aug 2020 19:43:24 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0c7e529d-4123-4f5f-24d5-08d83b0a2b09
X-MS-TrafficTypeDiagnostic: AM6PR08MB4868:|DB6PR0801MB1734:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB1734B70039C1EEFF7BCDC8A6FD490@DB6PR0801MB1734.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NOKdI4ymXAtV1H86Oy5Y04XR0GCb8wub//mC8JjP5QSIkoHX79rd4I4aW+6LRlPNNaUDv0i4WLiiR2ywHvZ3begSl60iNLMXzF7aLd55Eo0ffiy3aq+LjARRGMdLgwEdunZ/u1W/dZ4qrWxGTAswkQdXDEZxEbj+06xTUnOeCqXWUFcTyXlYWzEnmaHp8KJCKtoSseQ8pZU9oJSKlMLrYzXxVgCF/vLOXUbGKvAyDzKu0aJZz26LG6gDY/7rPbu2Osh1MyL7F531DL7yayrq14LYnzwKfekB7H3WhF7VXt+JeZ4b2Y/4Unz6iV4QnLc20Gc6f4W5lNFcHRXsjQAKOqe2PjFmguU9YcVJwkIGPov3lZ85X4PZiKgZiuG4t7Ocl8dedMAVTevwHg6TNr6wlg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(8936002)(4326008)(6916009)(1076003)(5660300002)(966005)(956004)(2616005)(8676002)(6486002)(54906003)(26005)(86362001)(36756003)(52116002)(7696005)(16526019)(6666004)(478600001)(66476007)(9686003)(66556008)(186003)(66946007)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 +aiNeOruOQQLqw5+VOwYjpsJqlLCce5r+LxPpB2xUuVNzNMkqA5tDhI+xhtyICDT3aoa/KXRh44kIr2fnetnUWW6la5u/wI230H+CNX8lwphUw4fBbdHnqDH20RTTjJbz2H4JIkgKZzLwonKaYBkb0VNKCwEolVJMr/CWkYbbIVLqtNqCpaAj5gdUPOHDiBrz5DHzltLfbDG+JJ73AfI987+MlWqRVjxrhoeQoc/YQ5JDvDQPXad6Ww6DO828WATGNn7MGuvtkB/xIYy+WD9gkppnSJ4Oz2Bku5eQgJvwQOGRQUAoShgUkFklWaAHqzsXX0/PGZGAMDyg5uPsbFk/qsF5D8smD5LWAUN/2Au4qU0c5qnL3hJYlJ9iwH3/ZF/0Ql95U6L+myvixrcaUUy46dlEFA9bVnswIFambw5bShsvPsfpnT3dv4eOfDLGZUhKKmg5PtdEei+MLP5LYFXceC2E67nY/5GiGiNWsdZBKvVO+n+7yqp8yZB7VAosHd8gqW8gtSR1aoJuXqkQGqjdHQcm4InxkBCgBZjrWrwsdZKu8JP6WRiLIs9AcHeDaGEC0eJqeqpuVuhwnIbqpkp2+lDLfM96IUUMiOc2bppZHbnOt+ezAemhQnzEZYFKCy0rOnEgYiHWKRmEOmhHBMUDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4868
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	30275ee1-3608-428f-a3ea-08d83b0a26fa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9FXESOItzt7EYiqEUfemzbXLVHFsvIEK25kZLKGNaudiyrIpXBetw5rbj2P1tpiJzMWhfpY8rLhqH1dK8ZFlzHN11jCO5p7QcvyenjSuy/0Cjo6AtDAeUaY4cpa2EqTart7Bd0ntFBiiduwIXsTT66MbdDqQwOPa5Cu7Zv1YMkaCP4hbOwLoEozL3aQD/z2Po+BLpZrFxt9ZfgdCQ8/sR7kleQwSA+4b9y8hXv5WrbC+y1C0KV6wtC1i4Cyg++66ySF8bfRuL5q9vZQzbcZWE2GUDeVS9c8+8TS+yNyuq+3xD3Q1r2vCvsUgWWa7Vcw8RbQrGtt1rFQmNqkZcEo82oAXsu76CxJpDLosD2II0WxBsylQE+wRAoBy+8CErLJKe5eIAkPIkcyNlJyl6qJpmo5nAOdAZ6+/vkcsy7XddNfNdXJyGo0VbhVeOnpKIRe/APAYGzsxNseRUSfXsAJnJ9zLII8zFJelATFbU5zOVfY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966005)(316002)(478600001)(70586007)(336012)(6486002)(1076003)(966005)(81166007)(356005)(36756003)(6916009)(47076004)(7696005)(82740400003)(70206006)(26005)(82310400002)(8676002)(9686003)(4326008)(8936002)(956004)(2616005)(16526019)(186003)(86362001)(6666004)(2906002)(5660300002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 19:43:33.0576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7e529d-4123-4f5f-24d5-08d83b0a2b09
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1734
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This machine provides corstone700 platform on the MPS3 FPGA board.

For more information about the platform, please check:
https://community.arm.com/developer/tools-software/oss-platforms/w/docs/444/corstone-700

Change-Id: I7b654fcb8dc5c6efa261a1413389271df87534cb
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta-arm-bsp/conf/machine/corstone700-mps3.conf | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/corstone700-mps3.conf

diff --git a/meta-arm-bsp/conf/machine/corstone700-mps3.conf b/meta-arm-bsp/conf/machine/corstone700-mps3.conf
new file mode 100644
index 0000000..28d7050
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/corstone700-mps3.conf
@@ -0,0 +1,7 @@
+#@TYPE: Machine
+#@NAME: corstone700-mps3 machine
+#@DESCRIPTION: Machine configuration for Corstone700 MPS3
+
+require conf/machine/include/corstone700.inc
+
+TFA_TARGET_PLATFORM = "fpga"
-- 
2.17.1

