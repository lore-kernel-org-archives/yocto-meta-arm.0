Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.52])
 by mx.groups.io with SMTP id smtpd.web10.6317.1587466161188623731
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Apr 2020 03:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Sfp2q1WD;
 spf=pass (domain: arm.com, ip: 40.107.2.52, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gabho5+2NxSgByyqKQbc/qkYuwptq2cLvpUmBPSXljo=;
 b=Sfp2q1WDoWJPESo590kjTPvNwCefV8YgdS5NvjZ+qh9wyHP3RfGQeogmb71XOAOsXNObiE6otFN3vuDh7+YUuFcQ7aFEuBjxGCU0Off90d8qTP0jx15SaWFqa9fZ6QVzdTH2aSq6FrajRiptuw8lQ3ZaFlwDKkbPBqCoPJJ3Cp8=
Received: from AM6P194CA0022.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::35)
 by AM0PR08MB5041.eurprd08.prod.outlook.com (2603:10a6:208:162::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Tue, 21 Apr
 2020 10:49:18 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::6b) by AM6P194CA0022.outlook.office365.com
 (2603:10a6:209:90::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Tue, 21 Apr 2020 10:49:18 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.15 via Frontend Transport; Tue, 21 Apr 2020 10:49:18 +0000
Received: ("Tessian outbound 76e9a4cf1540:v53"); Tue, 21 Apr 2020 10:49:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0f798a5da6a4867e
X-CR-MTA-TID: 64aa7808
Received: from 80fa44b2a8d0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7DFBAEDC-BAA2-4BBA-8954-8781D59D1563.1;
	Tue, 21 Apr 2020 10:49:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 80fa44b2a8d0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Apr 2020 10:49:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBekUTBoJc0dTqTwCzaKkUyWWiTL/15RoZHImJOBWUKCwmYr3plkBnKQe+LNyneHrl49XpZDaSW3npSQMfCCqpnGKB/778EgsJw50av1k6hpHGh13YHEquI9fu7cp7aAJGxyN1vAEjRCQuD17YgqnnmfpHNELxALa1yD3z5U46gr3SoNPzDjMaPS/EBSPfyrM6DLITwVCAflGEZ+VwQCMWWzvR0ZXR56UX7DN0uyd2X6uflJXOy1yfCS0Z4V+E5XyTTO9pP89qdBKYP3Zb3Ddx3tyRVUpAyRE5+uMb3aAzj4wA0dfuXYtKwvQUo9UKr/62N6OBat/10R+4vLGdDrrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gabho5+2NxSgByyqKQbc/qkYuwptq2cLvpUmBPSXljo=;
 b=FFN6eSMUxJ1TBg0u/gSgPodxJilcYdadhajTF0xkQvMD7MMm1Fi+7Xm9NUVC0EWUxzk+yXSP1b9YPZK/MHh+rheTWqRR94AXF0Iys/C0FqJ93QMflI1whgQsq0gV3n/Ryo8rjylonVL734LLneqJ9St/BTkHpWuIN8xlEZ6p5b1qaq5at3ERVLFWdNLic8eqD5G/DBHfnKGVWO+TK9Bhfhk/m0kNi9N6oHfDWg8Z0rUDdBCdW2yEVfObkojN7VvtXJbkrv/9ymc1q6FRmAjx6HkznjlQp8PsHDtsaDZFYKx3gaj7JkQRhGsjS4opUjKLdUoTPh27M+TRt7u0wcYDXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gabho5+2NxSgByyqKQbc/qkYuwptq2cLvpUmBPSXljo=;
 b=Sfp2q1WDoWJPESo590kjTPvNwCefV8YgdS5NvjZ+qh9wyHP3RfGQeogmb71XOAOsXNObiE6otFN3vuDh7+YUuFcQ7aFEuBjxGCU0Off90d8qTP0jx15SaWFqa9fZ6QVzdTH2aSq6FrajRiptuw8lQ3ZaFlwDKkbPBqCoPJJ3Cp8=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3914.eurprd08.prod.outlook.com (2603:10a6:10:32::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Tue, 21 Apr
 2020 10:49:12 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2921.027; Tue, 21 Apr 2020
 10:49:11 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm-autonomy: Fix xenguest volume check on boot
Date: Tue, 21 Apr 2020 11:48:56 +0100
Message-Id: <20200421104856.4389-2-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421104856.4389-1-bertrand.marquis@arm.com>
References: <20200421104856.4389-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: DM5PR04CA0071.namprd04.prod.outlook.com
 (2603:10b6:3:ef::33) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.49) by DM5PR04CA0071.namprd04.prod.outlook.com (2603:10b6:3:ef::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend Transport; Tue, 21 Apr 2020 10:49:10 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.49]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 25a3e2c4-83ad-43aa-96f7-08d7e5e1a43a
X-MS-TrafficTypeDiagnostic: DB7PR08MB3914:|AM0PR08MB5041:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB50415158CFB2C8F159250D599DD50@AM0PR08MB5041.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(6666004)(8936002)(52116002)(36756003)(44832011)(5660300002)(7696005)(66946007)(66476007)(478600001)(6916009)(66556008)(86362001)(2906002)(8676002)(956004)(2616005)(6486002)(16526019)(26005)(186003)(4326008)(81156014)(316002)(1076003);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 CvxRKjY/3qCmYmciMamFXMThHPKGotNpIWWYhp5Y7YQ6eTMmLzWuOyyRkLb2zKa3UYrQD+I5Ubo1lq/gPljR+kscGXkZ4ie8FXZ6Ytvaf5QFomV56c1rrRLeAmoFAvVFnUzknoVqABCOXXztMU0RJ8rF/jbvcwkSARWQyiNf/ZeAhzTD85xsdhkL4QlOeIillZhg2778D+sSKr1cfiBuRV9I7jUfDqguq1Tlfh43CXJtIBtowQIabrAYCBArMpjmE86+kr+xqXXFfKwHaor8YIPKWlUCo24GUN61O4CKEF2/oVNApimxSx6Zf7UpQ7UIgUFZq//0bkDQRlKFNuhSBVNzmPyrGRDk6GQRn9J3CyMrSy3ZDgQo44AUW6AHIn3xF7SE1YrYUHU63J7VVDS8K/tK2SwpcPP9qBmeyTYXoCRi9NkJgMAsNOv73guUqeRb
X-MS-Exchange-AntiSpam-MessageData: 
 JD5P1KTLPEvTHKax9VukCr+Iy9Aq5I1/as4+QFkP9p/dvri1+Z1dtZ50bfk4de1af58lR+0MuIBI0NFllkyM4BoU51j3cNd4EawnJk4ANwGsLkPD0xfdP0B3qce8+xoF61+HRf4w7RJQONjUZRNuEQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3914
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966005)(8676002)(36906005)(81156014)(86362001)(8936002)(6486002)(316002)(1076003)(6916009)(2616005)(956004)(186003)(36756003)(2906002)(44832011)(16526019)(4326008)(336012)(6666004)(5660300002)(478600001)(26005)(70586007)(81166007)(47076004)(356005)(7696005)(82740400003)(70206006);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bfee7b97-6ccf-4730-06a5-08d7e5e1a060
X-Forefront-PRVS: 038002787A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MJ2CWHU1FHkMFTSSy3ntzb8B+kKyeTlDqZjQdywE03clWVgy9EHogNYw5QzbytwdiTNXYDk0i4TE/wndl9G6spuCbg4MGPKo6kQKB02bn7Unt0RqWmcwwxaZkRn4Xe7UrFG8TM4li217/FBgiTume9CRZG7uP+d30OUv3LlHd1xlFcKLhxyQ+EnrUexzVVrakT0I2bF4TVR03k39gV/Bs2QZbTWscwlrWizfVJS6/IzT2UnJQe5rgrS37C0Yd8Nx2SpeMY60BMrzvgzoCbfGFXyvchf57AYzQewtS6rV1Qe3n39fymsI/Qt6TWfZQ+7MSdF1/D/SInHnGndBmSY9LIZUXrrbYAMqvkuLkwx953E4t60QcPiKzfSkz4SEis1MzqYZlLqOJI2HDcMBl7OYtcZxIJ5ECZZQm06TLL7K3JhfwMIW7sR7nfF3uKFJ5ip0FbVCJvVmkZXmIhegul13xEnINmTRiRFYZdr84Q4TiQd4wH/y0hgkzR3l3hyAsEQsdzCMYPpk5a+RBKFZK4W/Xw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 10:49:18.1289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a3e2c4-83ad-43aa-96f7-08d7e5e1a43a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5041
Content-Type: text/plain

Fix xenguest-manager to only check the device configured to be used for
LVM volumes for guests when a guest is created which needs it.

This prevent the manager doing errors during boot when the volume does
not exist even if it is not used by any guest.

Change-Id: Ibc285887836ea40595634412dcfa7ee9039dc220
Issue-Id: SCM-956
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 .../xenguest/files/xenguest-manager           | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
index 1daebc1..b25eeb5 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
@@ -19,17 +19,6 @@ source ${XENGUEST_CONF_BASE}/xenguest-manager.conf
 
 PREF="xenguest:"
 
-if [ -z "${XENGUEST_VOLUME_DEVICE:-}" -o \
-    ! -b ${XENGUEST_VOLUME_DEVICE:-} ]; then
-    echo "${PREF} Invalid volume device in configuration: ${XENGUEST_VOLUME_DEVICE:-}"
-    exit 1
-fi
-
-if [ -z "${XENGUEST_VOLUME_NAME:-}" ]; then
-    echo "${PREF} No volume name in configuration, using vg-xen..."
-    XENGUEST_VOLUME_NAME="vg-xen"
-fi
-
 function usage() {
     cat <<EOF
 Usage $this ACTION [OPTIONS]
@@ -67,6 +56,17 @@ EOF
 
 function xenguest_volume_init()
 {
+    if [ -z "${XENGUEST_VOLUME_DEVICE:-}" -o \
+        ! -b ${XENGUEST_VOLUME_DEVICE:-} ]; then
+        echo "${PREF} Invalid volume device in configuration: ${XENGUEST_VOLUME_DEVICE:-}"
+        exit 1
+    fi
+
+    if [ -z "${XENGUEST_VOLUME_NAME:-}" ]; then
+        echo "${PREF} No volume name in configuration, using vg-xen..."
+        XENGUEST_VOLUME_NAME="vg-xen"
+    fi
+
     pvs ${XENGUEST_VOLUME_DEVICE} > /dev/null 2>&1
     if [ $? -ne 0 ]; then
         echo "${PREF} Initialize lvm on ${XENGUEST_VOLUME_DEVICE}"
-- 
2.17.1

