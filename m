Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.73])
 by mx.groups.io with SMTP id smtpd.web11.2400.1605262793177838090
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Nov 2020 02:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=q821+zYT;
 spf=pass (domain: arm.com, ip: 40.107.0.73, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j85jftaM/obJqU17wzM7dAMGKAzkUsYn2KFH/CBjUjQ=;
 b=q821+zYTCAHMgGKbjTgUHY40gydhs/79H763APD7KqJnL5ryJ1/JuWC/thDmsY/x8DqnK7+MrlMpQ3txuVafIXLIXiEODpLmcacX/n24GBfPAoJ/JlMhCX/61ofHTCL8MG4ESlsKQ7AzZ2ZtrHsAIeCocPh7OgQiSqMdpAUr/CA=
Received: from AM5PR0202CA0009.eurprd02.prod.outlook.com
 (2603:10a6:203:69::19) by VI1PR08MB4142.eurprd08.prod.outlook.com
 (2603:10a6:803:e0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Fri, 13 Nov
 2020 10:19:50 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::7d) by AM5PR0202CA0009.outlook.office365.com
 (2603:10a6:203:69::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Fri, 13 Nov 2020 10:19:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Fri, 13 Nov 2020 10:19:48 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71"); Fri, 13 Nov 2020 10:19:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c4def9ec11a07cde
X-CR-MTA-TID: 64aa7808
Received: from 4d736babbc80.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id ACFCBC90-DA2C-4721-854F-6C2246AC6D87.1;
	Fri, 13 Nov 2020 10:19:41 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4d736babbc80.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 13 Nov 2020 10:19:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQ3ecYTpqSqCPUrDGBXp6UR4k9OgWWIkoSfpSRY2NUm6FBV88OoFrtQ/LP1FrVjgmUIU5Jor/L9xR1fhfRJJT3gJNiAL6NT/8Klm5q3/xCnb6IASUHrfWNtGRChonq0FjRXE6N/NUSAoimzdxQm0/v7UqDzYMQ90Ec986cfQtxs+RpwFv6euM9WbBjhv6emkwn6kj8KM/OoD457fT49RpuDor8tqgt9f61t9ZgsgMK3CG2iQ1LCnMjRw6/ABvzoFaxMazgWYYl3iHO2waLJTp01TUoJnLBxckTwie+103KtIuQ3pVbdO8rk4lzehokkM8arL1Th2BPB01FCmnxerMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j85jftaM/obJqU17wzM7dAMGKAzkUsYn2KFH/CBjUjQ=;
 b=k3H06Z/vebheIqX43bmk5Gn+9DlScNdD4MVBdH/xkW41tZ3MiKMpUTjSoOkLwTL1IKKcsOWSjTbD3oscSy8DBPu/u0JwDREKvsKU0YIFpz83/nzIrP6GLP7mVMQkFSNQuHLVVcDOZ3OiiebTe52Fl01/ZkWTonhJfCgRtcP4386+ir4Tytq8C08XivO3GS6ScuzgIY/6O7Rym/28wQv0V9MfVeD7ivx8tgj4qeov4b8bJ3I+tXff7d7M0wM/uQDCa77WsuIO/XvsLkZAARwMEt3POUchJBuQgKxK8b+4PTH9szhcDm7SiEHNNjwSmW6uaymW8wVq7ZJ69v5GS4KFkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j85jftaM/obJqU17wzM7dAMGKAzkUsYn2KFH/CBjUjQ=;
 b=q821+zYTCAHMgGKbjTgUHY40gydhs/79H763APD7KqJnL5ryJ1/JuWC/thDmsY/x8DqnK7+MrlMpQ3txuVafIXLIXiEODpLmcacX/n24GBfPAoJ/JlMhCX/61ofHTCL8MG4ESlsKQ7AzZ2ZtrHsAIeCocPh7OgQiSqMdpAUr/CA=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBBPR08MB6282.eurprd08.prod.outlook.com (2603:10a6:10:20c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Fri, 13 Nov
 2020 10:19:39 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::7481:42d7:df72:b159]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::7481:42d7:df72:b159%3]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 10:19:39 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy/xenguest-init: fix guest shutdown issues after host reboot
Date: Fri, 13 Nov 2020 11:19:31 +0100
Message-Id: <20201113101931.6372-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0509.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::16) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO2P265CA0509.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13b::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend Transport; Fri, 13 Nov 2020 10:19:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e8db88ea-a660-4fd0-4da5-08d887bda65c
X-MS-TrafficTypeDiagnostic: DBBPR08MB6282:|VI1PR08MB4142:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB41428A8299ACF38C089958EAFDE60@VI1PR08MB4142.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 85NSu6nQwLogKuJnBB/+KxceZHb5KV8q/PcZwZxJ0L1xJFdhepCtMjXEcQfpEcPyK/fsokdJaLIYEAcwMr8UwLdFT0+fUD1H7SKYkQ2lMDhxOOFT/lDaXQ+trJah0wX0068/7MKrtUFLiVfdt+hw76AeS+0z6N1p7HkEhe+86d47yGN0c4DXGipDr66OzutRIH52BqV2Q/J7WFL9v2iBRSvkS23TCBZRM0hlvxmKlprehK9qJxh8CilnrF6RD0dtm/DJ4RRwIR0xR1tryYE+W6CMc63sTI6zk68LvTluj593tZqpJnNbbuOM1IGUv7o3AupyX2hElNfYxbcGytHcMQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(6666004)(1076003)(7696005)(8676002)(2906002)(6916009)(36756003)(478600001)(5660300002)(4326008)(6486002)(66476007)(83380400001)(956004)(44832011)(52116002)(2616005)(186003)(26005)(16526019)(86362001)(316002)(8936002)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 0PJXJRJSdm/qusjWaCcBz0C5WTW/TmEr0IE7FpCRgW/f6AsrhP4WHUhCtwUtIvKoCBFIALSLCQm0CHCa3G2o46dc5lO1QRPYCfzI3/arivuW/n1qKnnymzNreJCR1vbYGsXAX3EyCvVxkRvRxEgRxtjyRJKV/h0NdM0/BApa9914pCeQmv8/PTLIusZDZKIoxORTzIBcfgxbCP+9zznOQzXpAqDdZwua9oFj4F/A7GU+z5K9smqvopBb4vma9WcftEAmPbNBuHIQ4tY9cCa2vVk3bmJV4hjtinjsrAksGNDtsc3CUaO8YueNUuICdu6zYelJy1blwzKk01FHKbTlWH7uW7MJoppL+Ua3pAZsr9rBpyA2GS81rkYEnIllobpOWpCPDsXGMjxg26ku/MnOCsBvehfkBGbTzdu3XLWCXUYyJRoUUZxZr8GwE4rzIcQwdhneLqHekX9WTYhhZWdVPhR03Fl8FNFVcEdmql0x3fdlKzvRYWxu9j8FDDsyuPUrfCS3X6WIUnTuZLWny3rmnv6q8t/nSjLZ2cKvj4TI8TSD3NS+g6qrCWBgQIyVEMvDWFBXIdhjeJtZdsPnMuEAVQEvZVa3xnYBQhN3II7J4enGy4kultt1l6rGZQ9WjSGsN1aL6fMgvZcYdjQ0INqVG3XVC7G0z5P3NA4lr8Lo5Rt0Na6fImxvPjnS7Dz2NmmU3JTMTIPLHAJKqx+RW38ieRzjuEgqCkElVlAxTQ6dbhmc4VXRPfqC/5KjqlhCud/NQP8jpWoT1tmsLlbTacIqMz2OtQ9F41Pn6OXnFoB461Sb4mF6vxcHs+JeCA94wQCAw684qz9JcVJjIdZ4jJj/jx7wiMZqWrMEaLFUmayXRXFZNqfB0l/QV+e9qYj1a/hZ4E8zymtKNRY7+NDFJyGuZA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6282
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1bcdc605-8579-4591-837a-08d887bda107
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	72i/miH9kXPe71c67hmL6P3I5bFuPgNk+xl2+7lUdftyAN6S+0sxPyacD9UFfg7zYDoGl+SOA/C0ouysD3wtsln7hmUuLQIfOB2Gu9Z7hR/te2oyojX+aIt3/TDkromyIks85OAhMqZ9GFVmAeImd5Ag+cnmuqqE4O/2ubVvcQR+jmLYxtTrAsw+sD/5mQBsy50SG+IshdEB6M7+x+28gDGIrc9NKqbUxOMEQfQ51zcr+5XxZ7CmBHo7Iw8MRPrrWpgmItWHFNgW7ogkHjnUiGcrj8iiDhYMt7gMaLYiK/DHmQKHPKz4R/r9NVDrqobAiYRjiYBob47EBvP/Sce8g6RGDTnM7ri3ekpQ7ulZzCwOX1SOyABYMnrOf/pK01Uwj65Cv5SDu4Im0hme2VMkgQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966005)(316002)(8936002)(1076003)(82310400003)(2906002)(956004)(7696005)(6666004)(36906005)(82740400003)(5660300002)(70206006)(36756003)(478600001)(16526019)(6486002)(44832011)(4326008)(47076004)(86362001)(83380400001)(6916009)(186003)(356005)(2616005)(81166007)(70586007)(8676002)(336012)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 10:19:48.0082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8db88ea-a660-4fd0-4da5-08d887bda65c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4142
Content-Type: text/plain

This patch contain following changes:
 * xenguest-init stop action uses now blocking call,
   and additional 'xl destroy guest' call if normal shutdown has failed.
 * xenguest-init stop action stops only running guest.
 * xenguest-init script is now caled before xen-tools scripts
   on host shutdown or reboot.
 * xenguest-network-bridge script is now called before ifupdown script
   on host shutdown or reboot.

Change-Id: I46e307fd0ad36b2e35559b4e8a071be9bbc50e34
Issue-Id: SCM-1632
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 .../recipes-extended/xenguest/files/xenguest-init             | 4 +++-
 .../recipes-extended/xenguest/xenguest-manager.bb             | 3 ++-
 .../recipes-extended/xenguest/xenguest-network.bb             | 3 ++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
index cd249cf..d580908 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
@@ -65,8 +65,10 @@ case "$1" in
         ;;
   stop)
         echo "Stopping xenguest"
+        # update guest list
+        guestlist=$(xenguest-manager status | grep Running | cut -d ":" -f1)
         for f in ${guestlist}; do
-            /usr/bin/xenguest-manager stop ${f}
+            xl shutdown -w ${f} || xl destroy ${f}
         done
         ;;
   reload)
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
index bd7963f..9c29bde 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
@@ -21,8 +21,9 @@ XENGUEST_MANAGER_VOLUME_NAME ?= "vg-xen"
 XENGUEST_MANAGER_GUEST_DIR ?= "${datadir}/guests/"
 
 # We add an init script to create and start guests automatically
+# run start script after xen-tools and run stop script before xen-tools
 INITSCRIPT_NAME = "xenguest"
-INITSCRIPT_PARAMS = "defaults 90"
+INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 79 0 1 6 ."
 
 inherit update-rc.d
 
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
index d0517b6..9464d43 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
@@ -29,9 +29,10 @@ PACKAGES =+ "${PN}-kea-dhcp4"
 
 # Bridge configurator needs to run before S01networking init script
 # Prefix with a_ to make sure it is executed in runlevel 01 before others
+# run start script before ifupdown and run stop script after ifupdown
 INITSCRIPT_PACKAGES = "${PN} ${PN}-kea-dhcp4"
 INITSCRIPT_NAME_${PN} = "a_xenguest-network-bridge"
-INITSCRIPT_PARAMS_${PN} = "defaults 01"
+INITSCRIPT_PARAMS_${PN} = "start 01 2 3 4 5 . stop 81 0 1 6 ."
 
 # Kea configuration needs to be restored before kea init scripts:
 # Kea dhcp4 server is 30, so lets use 20, to have higher priority
-- 
2.17.1

