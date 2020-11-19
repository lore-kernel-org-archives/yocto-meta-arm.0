Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.88])
 by mx.groups.io with SMTP id smtpd.web11.13187.1605808266439294431
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 09:51:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6+fcSPts;
 spf=pass (domain: arm.com, ip: 40.107.21.88, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88LHsF5v+OQhwVXe4jEckt8vU9hRCOfrKjAlwnRJ2/8=;
 b=6+fcSPtsy/iMv9nzxVrxYRZrffpqbDiwTtHFUap90QMzKpxTuoBSfEjLOqeASf16DsokSawlbgYNpq7NBKhao+v8JL2LaNNLjTMEgJrbVtu4tW4VCdZrADPiKk6CyaWk6TLscqQgXZp7PsMGw7N7uxM7DlNecyBPePNqvtuZXeY=
Received: from AM7PR02CA0021.eurprd02.prod.outlook.com (2603:10a6:20b:100::31)
 by DB6PR0801MB2054.eurprd08.prod.outlook.com (2603:10a6:4:77::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Thu, 19 Nov
 2020 17:51:03 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::8c) by AM7PR02CA0021.outlook.office365.com
 (2603:10a6:20b:100::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Thu, 19 Nov 2020 17:51:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 17:51:02 +0000
Received: ("Tessian outbound d6c201accd3c:v71"); Thu, 19 Nov 2020 17:51:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b876fd71a95de317
X-CR-MTA-TID: 64aa7808
Received: from 9e540d25f36f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F30A85DA-34DE-4679-8194-9769658AA48B.1;
	Thu, 19 Nov 2020 17:50:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9e540d25f36f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 19 Nov 2020 17:50:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwAefkmkGDwkmm1DILqx7FlzGzcdsmT4sfIXkdkEVPrqJEeQEJEX47zDxpkW7CEAbI4D2UtL7npNvvS7xmHM7rdnZeyO3OphgP+4IdCOt8LB+hXKlnXHAZFS/AMbhVDPUCTtd6cMNsM60jvzQqcGk1572ZQxSWYngjCOyF4dePU7dOqchBdxXRepVV6EpD36lcPFUy+xajPHUKLCZeFtCE2vNZ2LjYrxsuYzPbU52CWoSBFJsizki+p11fw4G54S9iO8X9Pwf2KSKieYApbxOPpDH8lfCcgOgb0VcAspVty4+n+egNDvXrIjrMbXE2WWzlsy4CH0NmBfqdYnF2lkjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88LHsF5v+OQhwVXe4jEckt8vU9hRCOfrKjAlwnRJ2/8=;
 b=a0GGcLswjkNkJKVxCkf6vI9PH2JSdO7wmeSb5GnbO3DfI5/AGRsQScZmoZWTNwgNUZpCrS2Ex/7FXDGKEzJBgNTf9mZwn3qllNBEWWqiwn0k9eZve1p8ph5qLelUhmyHmQfhY214ioNkCcSCQiwO2YZtzDiYAQqnhe3KcgrCyZZZuDx8iV6OEIBLDjBjpqW/rX4Q+5Lk36MibEyowWtCUk3SMn/3kMf1FJOBCbwTQG7DIXi/Q3YyiryO1YTFSDh/qiAmGdZ0rlcBG0rJJNuMDchOXjjStQwIvN6dI7q5MDr0Mh3Q8zSDQBPuA1GMie245SIKwWN532FToRU/7EvQEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88LHsF5v+OQhwVXe4jEckt8vU9hRCOfrKjAlwnRJ2/8=;
 b=6+fcSPtsy/iMv9nzxVrxYRZrffpqbDiwTtHFUap90QMzKpxTuoBSfEjLOqeASf16DsokSawlbgYNpq7NBKhao+v8JL2LaNNLjTMEgJrbVtu4tW4VCdZrADPiKk6CyaWk6TLscqQgXZp7PsMGw7N7uxM7DlNecyBPePNqvtuZXeY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM0PR08MB3043.eurprd08.prod.outlook.com (2603:10a6:208:5f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Thu, 19 Nov
 2020 17:50:54 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::105e:371d:a567:a068]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::105e:371d:a567:a068%7]) with mapi id 15.20.3589.022; Thu, 19 Nov 2020
 17:50:54 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/n1sdp-board-firmware: include RAM firmware for secondary device
Date: Thu, 19 Nov 2020 23:20:40 +0530
Message-Id: <20201119175040.32665-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.105.53]
X-ClientProxiedBy: BMXPR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::13) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.105.53) by BMXPR01CA0027.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:c::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 17:50:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9c4991ce-b8f8-46c6-b596-08d88cb3aeb7
X-MS-TrafficTypeDiagnostic: AM0PR08MB3043:|DB6PR0801MB2054:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB20542BCF76B7A95495EC4667FAE00@DB6PR0801MB2054.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:418;OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 gZq5tOTRfk7oXXmMSJeHjrOMQ2U1JLrkKR+uIkFQ/THu7XiP/8sSm37tsL3UFaSMEEzYjP0ujj38fEM13n/Wz9cO64m7HA3BjmduLL63S3FV7lHOJ33Xsbhbd3tyzwDlFccyE5SpBBtbuEeBnuY7PZdsYnQNhL2xO9bwC0XlzdfIrDy8sZokLPMUXRyRkVNsLzR7OA6gxExKO6BSDoP/+2VU/jt0MybwZZaUqoqrGRQ6O41q7aOcdeXticzqG0ADJKhqWjfQq82irOvt7eRpH/YNExy/h3wKzVcoBqVBhC//9qdKvTPUv7Fv1LAhhQkmWl4HwbjqKOt5cEvFdzOAHyAt4Mh2uQ9LGuMrwchJU4WTxcUhslINGxmBx3muTG06NZfkJGmwrphPH0ZTW1rF1A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(6666004)(66946007)(52116002)(83380400001)(66476007)(66556008)(86362001)(4326008)(6916009)(2906002)(1076003)(6486002)(316002)(186003)(5660300002)(478600001)(36756003)(956004)(8936002)(2616005)(7696005)(8676002)(16526019)(26005)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 450oXTf60ABzt7TRYDchH7KbokK1v+X5iXLVlSOX/1BbqI5Q8oTHnlJ2DUegti3v2vGn4/6jAJ7/pc+csHFb6S5Zbv+qCyE+eKPFM+RgghlNS5bEEqQfQepMyZR4N5qjlLzckMobX3NHTVyno6bFC8EKDMo5iiGyanArqu4itCqAwdmUXyJijqpTo2bbirDFpfBLfz58mApYdWfJ5I0pWPmXXcHuDpSgYadf7fQGTIDEtAFVmdwsCOiW/Z57jgHZHo6Cyv6+JbiGWLHnZl3eASLxQEUN42ZKSNNwel6pUR//c4UWG5mbcGUJHUnrrcEOQ3iRPNA/VcOQw3eZTwmH7lKqKeRoTx3sU8O7MF0KANhbdbX64y3JxEJst72WnWxG/wIeWw7WA9ftkt4mFDgTbYqk3pSJ5eznduT+AHXJ6G7tdd0mnrC2x42AgOAZXRKLlQ8UdLK9X1eMW1LPDNRDa5hKbKUzY7aIbS6MGf0kABr+9fkHiTvqv36UCsIeN70BI36bTnvSmo4c8n77xeMkzBwuXNdAN0NwwbPAb8LI3DWBnmvvtOS3mHduyNVjwB7Bn2YDRe14xTn8F0KoHdBAU+YYVwGtiZnnY6o1+vnPGFuqGTE7vGyTCgovHs/6Ks6Inrv1aJ1JeNKRGa1l8Ltyvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3043
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	92481ad8-d61d-4de9-733a-08d88cb3a919
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YH1twgmM9Y9EWy9ja1mK4JoAFr2/CHP+p0xEDRsQtqk5bXSLiMVyCwGnF68Dx0WjCFwUvYBszDcv2qLViKBoyXvo+5R8oPb/a6IuRuHrwZWazYg06s4dUbIMFWRs2vHWWcj/iDJFneBaaZ7qK54cKHNGSuKrFN0qRTE4kRGVkJCClYA4MJPapun1ae0Bi/e81natJsf/itz3H+lRHfs1qUuNKVajbdwoNSpUWeji1AY2kLU2Pbr+FnuDCH+/H53oJgnmzCQxQZwctsfl5rxh1le+PQJZwEpnQte5AMvxEu6YQRsW/jB8PY6k6dwNIeJxF+FxDj7lpHYMAJjw3MLwc4y9KJV6mjqQtH1qmGnguU64sopUOoDpL//2FfMEf5BtTCxYpqUKuUg7awoCZC9zD2nOtSOfr/wZrgm/R2UU9mVdN6C5a2oOgbfPN2qJ8P4t
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(46966005)(81166007)(47076004)(356005)(6486002)(36756003)(26005)(6916009)(70586007)(316002)(8936002)(2616005)(956004)(83380400001)(82310400003)(478600001)(8676002)(5660300002)(82740400003)(336012)(4326008)(186003)(16526019)(7696005)(70206006)(2906002)(86362001)(6666004)(1076003)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 17:51:02.9945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4991ce-b8f8-46c6-b596-08d88cb3aeb7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2054
Content-Type: text/plain

From: Khasim Mohammed <khasim.mohammed@arm.com>

While testing multi-chip mode it was observed that n1sdp running
as secondary device needs scp and mcp RAM firmware as well.

This issue wasn't captured earlier as QSPI flash had RAM firmware installed
and it doesn't get erased automatically therefore the device was able to
load it on every reboot.

Change-Id: Ied9d24429c7025206e35f50c8e5b6f090a590015
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 .../recipes-bsp/images/sdcard-image-n1sdp_0.1.bb   | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb b/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
index 13fa560..1ce0fbc 100644
--- a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
+++ b/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
@@ -18,9 +18,7 @@ FIRMWARE_DIR = "n1sdp-board-firmware_source"
 PRIMARY_DIR = "${WORKDIR}/n1sdp-board-firmware_primary"
 SECONDARY_DIR = "${WORKDIR}/n1sdp-board-firmware_secondary"
 
-SOC_BINARIES_PRIMARY = "mcp_fw.bin scp_fw.bin ${SOC_BINARIES_SECONDARY}"
-SOC_BINARIES_SECONDARY = "mcp_rom.bin scp_rom.bin"
-
+SOC_BINARIES = "mcp_fw.bin scp_fw.bin mcp_rom.bin scp_rom.bin"
 
 prepare_package() {
     cd ${WORKDIR}
@@ -33,7 +31,7 @@ prepare_package() {
     cp -v ${RECIPE_SYSROOT}/firmware/uefi.bin ${PRIMARY_DIR}/SOFTWARE/
 
     # Copy SOC binaries
-    for f in ${SOC_BINARIES_PRIMARY}; do
+    for f in ${SOC_BINARIES}; do
         cp -v ${RECIPE_SYSROOT}/firmware/${f} ${PRIMARY_DIR}/SOFTWARE/
     done
 
@@ -49,7 +47,7 @@ prepare_package() {
     mkdir -p ${SECONDARY_DIR}/SOFTWARE/
 
     # Copy SOC binaries
-    for f in ${SOC_BINARIES_SECONDARY}; do
+    for f in ${SOC_BINARIES}; do
         cp -v ${RECIPE_SYSROOT}/firmware/${f} ${SECONDARY_DIR}/SOFTWARE/
     done
 
@@ -59,10 +57,8 @@ prepare_package() {
         ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
     sed -i -e 's|.*SOCCON: 0x1170.*PLATFORM_CTRL.*|SOCCON: 0x1170 0x00000101   ;SoC SCC PLATFORM_CTRL|' \
         ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
-    sed -i -e '/^TOTALIMAGES:/ s|5|2|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
-    sed -i -e 's|^IMAGE[^23]|;&|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
-    sed -i -e 's|^IMAGE2|IMAGE0|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
-    sed -i -e 's|^IMAGE3|IMAGE1|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
+    sed -i -e '/^TOTALIMAGES:/ s|5|4|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
+    sed -i -e 's|^IMAGE4|;&|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
 }
 
 do_deploy() {
-- 
2.17.1

