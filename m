Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.43])
 by mx.groups.io with SMTP id smtpd.web11.5349.1607684808603312939
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Dec 2020 03:06:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=QoNyAkAU;
 spf=pass (domain: arm.com, ip: 40.107.20.43, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HV0iyoc4IeZBi5DdapwwBaee2t70fHtjeCvTbOIMXTo=;
 b=QoNyAkAU5TKmd9/6JxA/bA5A2cujenNpIRZQgkTzQnWKoFcO1ZEic/sviRTDHcNCTQ5Hg0JW3qQlUAct5dmVGmLezK+e5KubhmLjbqG1nO/MUiZR6TfjZvyCNJEOO0JiJnWVfi2VefQXaMcLNYgiGhOEY2xnxXPlvomsQbvwIAc=
Received: from AS8PR04CA0242.eurprd04.prod.outlook.com (2603:10a6:20b:330::7)
 by PA4PR08MB6254.eurprd08.prod.outlook.com (2603:10a6:102:f3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 11 Dec
 2020 11:06:46 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::29) by AS8PR04CA0242.outlook.office365.com
 (2603:10a6:20b:330::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Fri, 11 Dec 2020 11:06:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 11:06:46 +0000
Received: ("Tessian outbound 665ba7fbdfd9:v71"); Fri, 11 Dec 2020 11:06:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7e501b36d6c7e14f
X-CR-MTA-TID: 64aa7808
Received: from a7493473c45b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DF198D3A-AD16-4640-A22E-108A393909D8.1;
	Fri, 11 Dec 2020 11:06:40 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a7493473c45b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 11 Dec 2020 11:06:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlCc7JcwJyi1kwR5zx7xrKsX58C3eor7wufE16w7CW5mxOVhzpub9yZ7nqQ4TS4Dvc/kTiCPt2aqI4wGD112ANhTFvHi6AKFEsVbh+Je3Qi+A+6pkMNVtuY7oXfglOcRH1zQR5bVSK7GssQooeSHETfrqkBTC3opWAr6+r4diWsHstCvvs6n36X9rK/uXZDCihNqSAhLaQmAN9A40d+u42FmGjWwwqGHjSVuCLhii/qlGaCRI7VGNr30P4ofK64DmizlA94x264WPj0NTzwzhFSQZS93StmSi7wnRXiHhPcd61E7Rln5F9bJbOczEyj5G3HaS5vdE5J9hBZb1qd+hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HV0iyoc4IeZBi5DdapwwBaee2t70fHtjeCvTbOIMXTo=;
 b=ARYmqBo9MjFhE/gg4Nted6MNg9tFFm96zbg1oAJK96V9O/pThNZzzdVGAZBN985VGBUemPOI6iq6WpWmz0w1C38qRN4CHZEZ6a3E/xzppYyRbxu6hdNh2y4tjQNKBW7awckFGxkirKkDxeOBLQkEZugiBRIRo6GfozFf49OWfAfd1nPdLvlkAyb5pM9ArWqIkRDr/EOxZFF09HPvGETl2lCu+nUpkF4KRduJKxGGyqKnA+EcFU3CusYURGMjK0Kb69Qu+lFwbNC6LDqqLsyf0HsI1UleFsjZPrtOFp4994y+IkSFFNN5GcFkQZ5G/f1+8JTE9j6A79Ys4OjqXx4S9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HV0iyoc4IeZBi5DdapwwBaee2t70fHtjeCvTbOIMXTo=;
 b=QoNyAkAU5TKmd9/6JxA/bA5A2cujenNpIRZQgkTzQnWKoFcO1ZEic/sviRTDHcNCTQ5Hg0JW3qQlUAct5dmVGmLezK+e5KubhmLjbqG1nO/MUiZR6TfjZvyCNJEOO0JiJnWVfi2VefQXaMcLNYgiGhOEY2xnxXPlvomsQbvwIAc=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBBPR08MB6284.eurprd08.prod.outlook.com (2603:10a6:10:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 11:06:39 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::d01f:41c5:7a69:da6a]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::d01f:41c5:7a69:da6a%5]) with mapi id 15.20.3632.023; Fri, 11 Dec 2020
 11:06:38 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Kamil Dziezyk <kamil.dziezyk@arm.com>
Subject: [PATCH] arm-autonomy/xenguest-manager: remove double arguments checking
Date: Fri, 11 Dec 2020 12:06:29 +0100
Message-Id: <20201211110629.25106-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0374.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::26) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO2P265CA0374.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a3::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 11:06:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 15607039-02db-42b2-94b0-08d89dc4d993
X-MS-TrafficTypeDiagnostic: DBBPR08MB6284:|PA4PR08MB6254:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB6254542190E2ECE8DE459B0EFDCA0@PA4PR08MB6254.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Y+pLpaPndbh8L32BxrIMMdD2VE7W31vilgZAQ548T+ll+yL7IgUM3MniU+wZGoYxHoJZSED+WV8Kt2aaKMMhlI2fa6KhBEjGnw39pSa0kpn/Nj705pzidQw1EE25ObpVKcFdVItxYn193cQyU+YHlVLCIy3IRWccIJ+lGdDvtafJ+ITOATVW/fkoXi79l+W6eX3PU11QQHP2X+PK+SMdlCOF0PvKnaxZ5EWQq2JB6jydj86PxC7uFcFivLFZPwP2sKbjZbSa8Ve+UO4XUzqOzrxX/eFcuJsYmUeVICi14ugXhQglxHLBjxKYwmOzJzEC/FyjYxPSxE3BmgHQB333Ag==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(83380400001)(26005)(316002)(6486002)(66946007)(66556008)(1076003)(52116002)(4326008)(186003)(66476007)(7696005)(16526019)(86362001)(6916009)(8676002)(8936002)(478600001)(6666004)(956004)(5660300002)(2616005)(36756003)(44832011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?ayZa7b1PrRMyzzbkkshDKPiJyMF0o1qvYbgojaxqant67p443ZQ/cDrGu3Cu?=
 =?us-ascii?Q?SDw/5c5alqmMjUPX4/+6RcqcI5GBEMh0PgZlViTMGNrcFi7T6EQUz+hiLKdP?=
 =?us-ascii?Q?iSa7BcKF+0cYB7pvYEpwqeuE+b9zZXoWTgoOGWb1C3+GKa4nUKwWTDpewBqI?=
 =?us-ascii?Q?vyQcXcPZHcSL2wBh0lOsz2PKLFBllAS/g3KfNtop43b+LFBukxKzoxrlKSUr?=
 =?us-ascii?Q?rb6DqJfb3dX9dNwvR/A8G8gv28tJj7tHS3GtWeRUbBO548L2XUYCmqr2VLC6?=
 =?us-ascii?Q?xSH60EWNEaD96bAUA0t/P2B38I0VF93H0IznvnP8a24YSs7ZznQasoL//Km/?=
 =?us-ascii?Q?Nl/WhAT3mBe+Rqcb0kvGGR04uML4W7imnX+5G0rUV8ObQH0UhroB+Q07j4Ge?=
 =?us-ascii?Q?jYqRwc87C9Enhua5by0rMBlrjbNV74oE/dnd4bwEMtSWZom7rebteaPbSbAC?=
 =?us-ascii?Q?uKhWYgoJjRE7CisUFf7h9/LfdK2EZ0amwA0aRAmhExMnSH++UDdn3pyKk841?=
 =?us-ascii?Q?K9mxM3TgCiwy73x6NKk2rKstgxri2XMiuKzQ8iLdi2S9aAROemqoVutOAFVy?=
 =?us-ascii?Q?V0tZb1fxZadMoJdhoHISGHWBnM+ERP0vz13gBGmwaYN8j5GZqFFbV2Fj/Fdt?=
 =?us-ascii?Q?WWalYVpgjD3MYHQRNJq+H8qBkfD57TULtBm9n1afvO6LSy9YRKp056qsRVMz?=
 =?us-ascii?Q?dHWJ9ViuLgk4qvX7AKc7rlMPKYbqP+JT63R1QVM/wf+Nkq+y0RhjfsI7/J+w?=
 =?us-ascii?Q?HA4rP4pc8n8sl5A4wSivNSrXiEqSMmZjwIhmIyVJMrKhSHm3cO9vCTRBDVnU?=
 =?us-ascii?Q?MVFQZVIhUGbjcmJp8HeObhcA1HzeXUATuNzb97c7fJAGAm8oYsUxdKJmx364?=
 =?us-ascii?Q?Hs63jM1t131u1UJkMwr3le32GgbLUiK9hQAPcLgiZRZkQD9AxBLsyphNJOcM?=
 =?us-ascii?Q?gUcmbWirRJHVTYm5r2kYRXYjzVToldewLwU5dqjfxud340fNue5NmA7IdQNN?=
 =?us-ascii?Q?ybuZ?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6284
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7ac053b3-99a6-4cb8-5df5-08d89dc4d4ed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vS4Y7ynRCwIKzJXdbVcrTPSUkIyxi4FPTWEB1wdvM6R3z0LYnS2Ql5ETBD1Eb71z3JEJF0yEnXa/fpOLjn4Opy6Rm+dB+Y33Ay4x3hXJ1W79gj1EgrrhVD4UkbzzauR8tszJaJkZUywEX8Fjszav4CNuEKKbY1d0sJE7Sq8c1QiqYFvD6xDTQruG7D0Tgw4WQ/w0fCjR+1JDvRS2ZeY+aLKhIJfnwt9QyQtv72qYwwXXEmWVEgpu0MF4qqBp70p+RD342ZCGoQun3m/QNLS5EZLd7Eu4RNypVl+qt37FZM1desq4AnKzcUm7GNAuurzGS8JAKxKYQR5xpi0auvWUuMsy4LyvpERmyors2A6vXMQ7saxJ4AtBdzHbwiNKt1iuPSTpa0xQvsR0MZN9307sxw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966005)(316002)(83380400001)(7696005)(356005)(86362001)(6666004)(70206006)(26005)(2616005)(5660300002)(70586007)(4326008)(36756003)(186003)(82740400003)(81166007)(16526019)(336012)(6916009)(47076004)(8676002)(2906002)(6486002)(44832011)(82310400003)(956004)(478600001)(8936002)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 11:06:46.1754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15607039-02db-42b2-94b0-08d89dc4d993
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6254
Content-Type: text/plain

This patch brings following changes to xenguest_volume_init() function:
 (*) removes doubled arguments validation,
 (*) adds missing check_private() call,
 (*) inherits diskdevice and volumename values,
     as first and second function arguments.

Issue-Id: SCM-1520
Change-Id: Id01a326c2db5db1fcaae9237f887e97ea208d6ff
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 .../xenguest/files/xenguest-manager           | 28 +++++++++++--------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
index fafe4a0..9acbca0 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
@@ -113,28 +113,32 @@ check_size() {
 
 function xenguest_volume_init()
 {
-    # Return:
+    # Inputs:
+    # $1 - diskdevice
+    # $2 - volumename
+    #
+    # Outputs:
     # 0 - success
     # 1 - failure
+
+    check_private
+
     local diskdevice
     local volumename
 
-    if [ -z "${DISK_DEVICE}" ]; then
-        # By default guest is using disk defined inside xenguest-manager.conf
-        diskdevice="${XENGUEST_VOLUME_DEVICE}"
-        volumename="${XENGUEST_VOLUME_NAME}"
-    else
-        # If guest configuration contains custom disk setting,
-        # overwrite default one
-        diskdevice="${DISK_DEVICE}"
-        volumename="vg-xen-$(basename ${diskdevice})"
-    fi
+    diskdevice="${1}"
+    volumename="${2}"
 
     if [ -z "${diskdevice}" -o ! -b "${diskdevice}" ]; then
         echo "${PREF} Invalid volume device in configuration: ${diskdevice}"
         return 1
     fi
 
+    if [ -z "${volumename}" ]; then
+        echo "${PREF} Invalid volume name in configuration: ${volumename}"
+        return 1
+    fi
+
     pvs "${diskdevice}" > /dev/null 2>&1
     if [ $? -ne 0 ]; then
         # Check if there is no filesystem in the block device
@@ -229,7 +233,7 @@ function xenguest_disk_init()
     echo "${PREF} Create ${guestname} disk."
 
     # Init our volume
-    xenguest_volume_init ${guestname}
+    xenguest_volume_init "${diskdevice}" "${volumename}"
     if [ $? -ne 0 ]; then
         return 1
     fi
-- 
2.17.1

