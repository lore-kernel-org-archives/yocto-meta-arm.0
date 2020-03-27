Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.45])
 by mx.groups.io with SMTP id smtpd.web10.8819.1585306253705463026
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 03:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qxYEMbqN;
 spf=pass (domain: arm.com, ip: 40.107.15.45, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKfLpkRtp2G0Ds6M9ayGpF4UoUBankiVS4/5ee1gH8I=;
 b=qxYEMbqNxbf/1Yt2G35Ujq22wsYzFJibTYAarlfctZzRpjB3KJ7vA5CNbvYwPxAHDhVTt3ddoniGPld1e4CObGRV1Xy3bTOpGCaK/oP9Uhjjrqngctn2UzNIUw/+rwEW+r9db6dWpsHctluXAp6CZAH2jV1G1mJ+JelRly/Q62o=
Received: from DB6PR07CA0203.eurprd07.prod.outlook.com (2603:10a6:6:42::33) by
 VE1PR08MB5230.eurprd08.prod.outlook.com (2603:10a6:802:a8::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.20; Fri, 27 Mar 2020 10:50:51 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::3) by DB6PR07CA0203.outlook.office365.com
 (2603:10a6:6:42::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.12 via Frontend
 Transport; Fri, 27 Mar 2020 10:50:51 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 10:50:50 +0000
Received: ("Tessian outbound 66307db0259d:v48"); Fri, 27 Mar 2020 10:50:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a7149bc372d9e1e0
X-CR-MTA-TID: 64aa7808
Received: from 90c2b1d93b62.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D70234B2-7C06-4709-9997-9A92C96522DD.1;
	Fri, 27 Mar 2020 10:50:45 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 90c2b1d93b62.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 10:50:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhLbThMJMj22dwMIwxQxr52+Hq1yztllM1bEkyQMlL1Ib2GLd2xuHp0QNrSwdAx78DpwqU6sbTTnrCx51XNvWlTdeOjX9B6jqNeZhjuMaEQGkYMA8mjZX1hRrnZo7BJm6yikh/bTtXrVI789YPlQy0JFcx337E5EFK+ROkOIr+7mlML4Z3BQQ8d5ADVE8YspG1Pg3PpNhbHgHRiHbHxGya3nMz80MTkdnexAfaCOnD5Q8kT45zwV1fW5hIvbXbEf85nYgnWqJ3IZQOBnrEXUTRZs/uG70pHWrWv9QTZDtrdK0ZZmAAIRVJuN08jSxMTb+jORuSIaClw3UEQH6jm9QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKfLpkRtp2G0Ds6M9ayGpF4UoUBankiVS4/5ee1gH8I=;
 b=Gix4E4b0cFsoRJhMOqYT2WVsQXeLJnBKWzM6GK0F+iKgAotU7fUJHK35fXGkPbj0JWlL5LvZTZpWzfcvkzcwpU4o+FQD8JL1c1d1tvoOfT95P2mB6d98uINvSPEP3eIWaVcNOXIBVhSG7jBPlIvC6kdP9o4rrAQQsOyt7xZGRFkKyMvgEI0CrRQJT/aP6teXRcav988NoZs/l8MmHxN3Kne+E4p04JBH9jIMDmNrxcldpgQ4UE2IhFRVkDKOLaTp5NebK70b4tSysBCz0eWkwHbhB9qk65BSmjVHpjnYQb/SDvqkjy8pTbvsFjnpiqOBZDXEqeIWVp91mPywDw5x6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKfLpkRtp2G0Ds6M9ayGpF4UoUBankiVS4/5ee1gH8I=;
 b=qxYEMbqNxbf/1Yt2G35Ujq22wsYzFJibTYAarlfctZzRpjB3KJ7vA5CNbvYwPxAHDhVTt3ddoniGPld1e4CObGRV1Xy3bTOpGCaK/oP9Uhjjrqngctn2UzNIUw/+rwEW+r9db6dWpsHctluXAp6CZAH2jV1G1mJ+JelRly/Q62o=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3450.eurprd08.prod.outlook.com (20.176.238.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 10:50:41 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.025; Fri, 27 Mar 2020
 10:50:41 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/7] arm-autonomy: Create meta-arm-autonomy layer
Date: Fri, 27 Mar 2020 10:50:04 +0000
Message-Id: <20200327105010.400-2-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327105010.400-1-bertrand.marquis@arm.com>
References: <20200327105010.400-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: DM6PR12CA0036.namprd12.prod.outlook.com
 (2603:10b6:5:1c0::49) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.50) by DM6PR12CA0036.namprd12.prod.outlook.com (2603:10b6:5:1c0::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend Transport; Fri, 27 Mar 2020 10:50:40 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 576e3dec-504b-4462-a37f-08d7d23cb726
X-MS-TrafficTypeDiagnostic: DB7PR08MB3450:|VE1PR08MB5230:
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB52306C7FE501D11EF6ED06869DCC0@VE1PR08MB5230.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(86362001)(6666004)(5660300002)(6486002)(4326008)(44832011)(956004)(2616005)(16526019)(478600001)(7696005)(81156014)(8676002)(66946007)(36756003)(26005)(1076003)(316002)(2906002)(186003)(6916009)(66556008)(66476007)(52116002)(81166006)(8936002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zuXHTnAs8kLHVW1V3U3Bfp1aNWyJHkT1xSmsRZ9XYPHVFVE0dMH98Bv8WhHnp6pcKwADrwTQqpqJ9o3miGoMWRIc1+AKJ8NnJ78iMaCOyiTB2Nt9hrxt6yjraAGKudn5aT/IRnVuTN0uB2MBq4lCL+701zazLSws66NRAds4YcaftEeUlT0cdK0m83ftmeOKYYtlfad5KU2AX9mgCfa2lDbTUApHqzkMkNfjFdkcA8el2wO9ggJ+X9U+vl4etJ/rreYkwcg1tSX0wxbsGU8b5GzmpRUCe8XMFxIxV4lSxoUU+TYfg1Krv27O3XqiwhPDHCdZSDQsYT0s5PxY8EHjBuy6ybtrac8meoHrtQREv0QgNoeLrYOPVHQHjOVHOrbMLaP9FZkRygh5V9wIorHQLRMVYVznR1YknrSKu/LvOXlQw/IyT1vkrlijoDHLaN7uI6NvVWm1DwQcLVWiRuCoEwFi651+XQ4EuUfakmqvbZPBvXIv3iqGAddg+MpQgiIj165ra47hku4O95QsVJD/KdcNz9UsalRhFCIrauxIoQ/2O3tPcbFhfckP0oI2qe+JAMg3LEXD0DyxGR0/0W0Wwpnnt90q1/5PZJCiN2Db4xQEcnYKD9/zDoVWOR/dwaT4NLFipqmAIabQyW6iTj7BPRZH9r/bpiLIIaYQDPxu758WOeNcYXdYfPX97NxzU4n35MBzbvl7BfHxsHTbtJsUVaHWi1M90oSLVuYY331wlmE=
X-MS-Exchange-AntiSpam-MessageData: 
 +awn8y5SCHa3fHPovTlHPaLCGmnxKyOe3I3Iu70osnl6rm6fm4+TAeT58GyvWlPEAynpM/yu3Nt2u+4JKHDGlKmiz24oYjm/2SSS8dXudBRk501+lt3s8Y7XM8raMbnjDv/6XHpQ6Vq8FxvTtIgQdg==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3450
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966005)(2616005)(44832011)(47076004)(1076003)(82740400003)(6486002)(2906002)(5660300002)(8676002)(81166006)(8936002)(81156014)(70586007)(356004)(36756003)(6666004)(70206006)(86362001)(4326008)(478600001)(26826003)(956004)(186003)(6916009)(316002)(26005)(336012)(7696005)(16526019);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ed60538c-8b6a-4934-b352-08d7d23cb144
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h90rPgG+PINFqpjOkoCGE3XTOQuqlqoug03s9JADfixuNq2ZbsxB8LSb0qKuYbdHVZ4heySBEK49gNET+b2r4vtd1+avGIMe5S3Jy8Tyu67rI1pRvC1XWHV1oyUtPyijKj3Mp2P/U3wo+OFOA5Byfi1CgLz4zbqjG5GKeGBXJS2mFjraU+R1uwRtHoxaD+0jAPg8/KJF7EH5TyIONIhqmz4NP2WVA3JNvIPuK2ERcr7OfaBmPi1K2cf6nwmz4GnUzGizLsNWl762QhdfF24Pm06HJV7cHWRgzMrgUq+9OLAc+scJQ7KC2taG/sG6a7ZxhmkDuHkER1g4QwINuCc/0LhaJBtfO0WaciKZC1xleAJYsdFb9F6ZHGlvvTZ9EY0Sfe3F1nhiOxDDs0Zg7g7FcahLhyRA7K2dUW1g3B2JCE2geUzEuqDxQUrGOeMxEDHCFBfmXvVcr0Xz3OYsze805vBQyjiDDFMVlfa2nj4y/oKKUeMmp3/gOoXqASOTn+dPz4z5/0L75R8O2mw7XSI9+0ebsuEcYn7t2XjWBCXiLt+lR7wqN1Eaopph4WFF0cLJNd/lYA6ttSJPeTupDBALvg3pci+BVgPya5SttfjY85En4N7Kp+uZRznIOteVzfY3Xp352TbzBjB/SxxvQFiUcVKvA44I93xK5JSnQ4n4Toc5WwEe/mkGrN/OJlLuCgTFINknL4QpWq7r0snRSDlxPlHcmKOrCC+9tu0shfhElH4JHCVe92mCfxIfTfXnDdXKblpV0gWLmfiAv7otQnffizTgcUwndPwMYSM2XiLoa00=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 10:50:50.8777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 576e3dec-504b-4462-a37f-08d7d23cb726
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5230
Content-Type: text/plain

Create a meta-arm-autonomy layer in meta-arm.
Add layer configuration file and Readme.

Change-Id: Idf3411edc21f3d13fdc7146fcf34700d2aab1c41
Issue-Id: SCM-767
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 README.md                         |  3 ++
 meta-arm-autonomy/README.md       | 51 +++++++++++++++++++++++++++++++
 meta-arm-autonomy/conf/layer.conf | 25 +++++++++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 meta-arm-autonomy/README.md
 create mode 100644 meta-arm-autonomy/conf/layer.conf

diff --git a/README.md b/README.md
index 20b106a..04c641d 100644
--- a/README.md
+++ b/README.md
@@ -16,6 +16,9 @@ meta-arm-iota:
 meta-arm-toolchain:
 	This layer provides support for Arm's GNU-A toolset releases
 
+meta-arm-autonomy:
+    This layer provides a reference stack for autonomous systems.
+
 Contributing
 ------------
 Currently, we only accept patches from the meta-arm mailing list.  For general
diff --git a/meta-arm-autonomy/README.md b/meta-arm-autonomy/README.md
new file mode 100644
index 0000000..f8a1404
--- /dev/null
+++ b/meta-arm-autonomy/README.md
@@ -0,0 +1,51 @@
+meta-arm-autonomy Yocto Layer
+=============================
+
+Introduction
+------------
+This layer provides an hypervisor based solution (currently based on Xen) for
+autonomous system. It contains recipes and classes to build host and guests
+systems.
+
+Dependencies
+------------
+This layer depends on several other Yocto layers:
+* meta-openembedded (https://git.openembedded.org/meta-openembedded)
+* poky (https://git.yoctoproject.org/poky)
+* meta-virtualization (https://git.yoctoproject.org/meta-virtualization)
+
+Distribution Features
+---------------------
+This layer is adding the following Yocto DISTRO_FEATURES:
+
+Bitbake variables
+-----------------
+Some recipes and classes in this layer are introducing variables which can be
+modified by the user in local.conf.
+Each recipe introducing such variables has a chapter "Bitbake parameters" in
+its documentation.
+
+Those documentation files should be checked for variables:
+
+BSPs
+----
+This layer is adding the following machines:
+
+Images
+------
+This layer is adding the following images:
+
+Recipes and classes
+-------------------
+This layer is adding the following recipes and classes:
+
+Contributing
+------------
+This project has not put in place a process for contributions currently. If you
+would like to contribute, please contact the maintainers
+
+
+Maintainer(s)
+-------------
+* Bertrand Marquis <bertrand.marquis@arm.com>
+* Filipe Rinaldi <filipe.rinaldi@arm.com>
diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/layer.conf
new file mode 100644
index 0000000..2dc24a2
--- /dev/null
+++ b/meta-arm-autonomy/conf/layer.conf
@@ -0,0 +1,25 @@
+# Add layer to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+# Add recipes-* directories to BBFILES
+BBFILES += " \
+    ${LAYERDIR}/recipes-*/*/*.bb \
+    ${LAYERDIR}/recipes-*/*/*.bbappend \
+    "
+
+BBFILE_COLLECTIONS += "meta-arm-autonomy"
+BBFILE_PATTERN_meta-arm-autonomy = "^${LAYERDIR}/"
+BBFILE_PRIORITY_meta-arm-autonomy = "6"
+LAYERDEPENDS_meta-arm-autonomy = " \
+   core \
+   yocto \
+   openembedded-layer \
+   virtualization-layer \
+"
+LAYERSERIES_COMPAT_meta-arm-autonomy = "zeus"
+
+# We don't activate virtualization feature from meta-virtualization as it
+# brings in lots of stuff we don't need. We need to disable the sanity check
+# otherwise the user will see a warning on each build.
+SKIP_META_VIRT_SANITY_CHECK = "1"
+
-- 
2.17.1

