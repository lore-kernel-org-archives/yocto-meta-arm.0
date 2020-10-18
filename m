Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.66])
 by mx.groups.io with SMTP id smtpd.web12.21150.1603030666345302560
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 18 Oct 2020 07:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=o/J12BHm;
 spf=pass (domain: arm.com, ip: 40.107.0.66, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AYk6PXLK+8dzCs53FtqMIxAUgCtyBfnnbSIfzo/UKY=;
 b=o/J12BHmwHa01H95+TZSIk7I1xBOtvnTwIRoZeO5N+rty4ARFaLalKbDjdIH1otgGvs/U9Jmddt4y3xdYTTTrCbPdPQzy5FHZQ0apPzVO1KWzBfCvl1Ctr/E5I1yMsPwpu7KoSTWQYxIPrubObZ5Tj8BWk8torW3IzMOKrZsnLA=
Received: from AM5PR04CA0023.eurprd04.prod.outlook.com (2603:10a6:206:1::36)
 by AM0PR08MB3186.eurprd08.prod.outlook.com (2603:10a6:208:5d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Sun, 18 Oct
 2020 14:17:43 +0000
Received: from AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::9) by AM5PR04CA0023.outlook.office365.com
 (2603:10a6:206:1::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Sun, 18 Oct 2020 14:17:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT024.mail.protection.outlook.com (10.152.16.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Sun, 18 Oct 2020 14:17:43 +0000
Received: ("Tessian outbound c579d876a324:v64"); Sun, 18 Oct 2020 14:17:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 97157e9757c47e90
X-CR-MTA-TID: 64aa7808
Received: from 758cb69faa82.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DFDB1D64-5FA5-465F-ADAA-C814D0C123F1.1;
	Sun, 18 Oct 2020 14:17:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 758cb69faa82.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 18 Oct 2020 14:17:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3VUSBCvOit7wFztTfSu94gVWkqtbzXb0Ex81z3tBFsJyn26CY5c84gPAgPOouXowV9S0z96dx4ubIQIhm6p8Rup8zjUS6BwR+rTAb7TqD0/3QVRNKERaITjA0tbSbKAtcr4cQlD6tiFyRpv7Ki/i6bw7Kx/GitV1GJGquBmEgU8frfxORqIm5eU6aqCQzsKMZwnsIjmYs7Lw2LoHj1ZlW3XP8aE/cCYTffZ8k+nf7VIDtGlCnGmgu2IskHiz+VKFzpDsoAXdjW/SpT1j0gXm9i0H93SvoAzJ7yYh1hWtYmLIzN3yjT1P3Vzo9MniLbYAqXYy/YnBx4q0o3gXAB79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AYk6PXLK+8dzCs53FtqMIxAUgCtyBfnnbSIfzo/UKY=;
 b=Ew9q5Qwecp44lH8SFCUgfVnObVBYL52rOppRgjmBWYt32rI6gk259SSme21SB7oWQ0xKOIGKlkTNgbh6l0QJ4Ctg9WGZPfTbnSlSBj5NnvMgL8qCWYUEd1uaJtxYN1vSwxw61MfswtJpT3H0XLOAVPWNyHpnbD+s1tCg/RtP0hin/zTGDbT1XBY7HxYWroGM61WujMm079RDcAIYSPsm6ghyd5fPlNCU3Cjse4te68gc45GhCY61/uhbza6rzkjmiSwloU9KFalMkfNoGWfwdB633ieSQfPIZbf+LB9pSK/BEq4/NzDE9KjLanIAPynwIBphTsJehFU2mkHtnp4Qbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AYk6PXLK+8dzCs53FtqMIxAUgCtyBfnnbSIfzo/UKY=;
 b=o/J12BHmwHa01H95+TZSIk7I1xBOtvnTwIRoZeO5N+rty4ARFaLalKbDjdIH1otgGvs/U9Jmddt4y3xdYTTTrCbPdPQzy5FHZQ0apPzVO1KWzBfCvl1Ctr/E5I1yMsPwpu7KoSTWQYxIPrubObZ5Tj8BWk8torW3IzMOKrZsnLA=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM8PR08MB5732.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.25; Sun, 18 Oct
 2020 14:17:32 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::d1ba:1582:16de:1d00]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::d1ba:1582:16de:1d00%2]) with mapi id 15.20.3477.027; Sun, 18 Oct 2020
 14:17:31 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/n1sdp: add support for startup.nsh file
Date: Sun, 18 Oct 2020 19:47:18 +0530
Message-Id: <20201018141718.14271-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-ClientProxiedBy: LO2P265CA0048.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::36) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LO2P265CA0048.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:61::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Sun, 18 Oct 2020 14:17:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 048e5e68-a00c-4f2a-6b95-08d87370943c
X-MS-TrafficTypeDiagnostic: AM8PR08MB5732:|AM0PR08MB3186:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB318646F993F4D847FED591C8FA010@AM0PR08MB3186.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:291;OLM:291;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3tDB9gnLinRzukdSKTPDnpZvu8dTy5/AOX8l7K3JzrgT2w50zXsVAuurp1aelvVrl9mYQZvZjdBB2TjB8uym7FA7Egk5G6fhzYPpMdFuzc8YDPUUZZy58cbABfvtG4EwBKRYmiAqSp8mNOF2YzUlY+CdbrnR+dZrfzklqlBcnMPy/6RlD/O9PLtMD1noE4VdNyITciYlXodJwTgj/GcYMYEz08dTvXbOCEYmDO8qncWsyWt8Y6UEWCFKPTh57sZFBuW3AKa2XdBvLgkYtOAaDhMt+GtysbgLh9SmWlYzRTGTqfA1dezXkqgisRzT9LsJWhptE6a/OokHXbsUa1IYRYd2vxmNG3LkcA6rfnfR8J9B4WJXg4j6LNofJ0wxJZZ/
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39850400004)(366004)(956004)(66476007)(66556008)(2616005)(66946007)(16526019)(6666004)(2906002)(26005)(478600001)(8936002)(186003)(316002)(6916009)(7696005)(36756003)(4326008)(6486002)(52116002)(1076003)(86362001)(83380400001)(5660300002)(8676002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 +U6u0iSAAgZBh/OnZ9u1rvEn4Zc0vF9aq5o7evLXUmpcR+TWaSMLDKUH61RgLl/livuWY5lBqiEgLnpTNTqXvLJDdheuQSl4IU4KOaeiG9/O6WLbzFgEsiomt32V52s3SyAw4BRmfsJCFnmV4G16HOjSjIa0yLg0VRVJYP/d+n+n684sZRX4lvhe2AT/N6VHrwTx4Ob0wz86cV65pVSIJunGHp4cHAdQ8fqej+Nf7nb+41Sb0gHud8404iszqF3rvolR2KWs3fn6ownP2y5pzCQWyJY3NXYdsb2GJrW3PHMwjkSW8JgSArSmGwuvikKwxBOw3X6b79VrwVrQwq7+645h+XbEHQHqS2yssC4j7Rwc3cieO3/E62IKqJGc9yS4JvAJ69IveNrmbOCUCdPlXety0s1+Uwr15lwOBilf44pLUCnCrX9IChRGXJoUX3bCpIAdVX5dafUkjhmxxP19vKw/He5bXyTcRm5qsQtFm5Ja0F2cN7Iv3rDnmD9OBEvpQAMiMHie9CRSQ43z6hewrWAWGNncFibAkRYPEhhvykOFB95nGQIBNupV9BgPSP9gKaYl5K2D3AL1+zbdJOuT2H0bCG/fD2+QMES0yQQL/KlMwHe8Eg3lAiJI306VWOL8I3cOIEJ8eUr/HRfqGkZOdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5732
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	52ad8779-44a9-4ca8-1120-08d873708cfd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oowpufa+stgt/3bSFcDVkkSVekvKXdoQyzq7h3IFtXhkN4jCKIPjCz2Cri5xfwb6bO4O3Bo9VIhXZMmvrMS3KwReMcAp3Ln9C/J+6eOTs1XUvhCwYu6Unvv1SSoERJD9B2UPy567c1+dD7hc9G4E0j3YxwPMofu8tvJ0DZgIeNtQ7BSsJpZ2JROBuOKnWkZ62zECUHf3QWD2RA0fpId8o2NF2mOvdV7trntLmPL5gyadfJ7ZKUX8eGswRebs0XAhbQl6SwMvsostjuE/NmYLM5jodT4HVE8TP3X9fu4hq4Dq9GJ9U/MqbdhlXTpTlhadBBaC2615VKWtUHvQJMqa1uG6SCYgjsGa3vDI/GlfC7r37Y9k253FmNjdCLTWwKaOTHgdMUEeEgNlKqZ7hYP+oDOMpewj+rkzcua8ECj0Wf4=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(376002)(136003)(46966005)(6666004)(478600001)(6486002)(70206006)(70586007)(5660300002)(83380400001)(47076004)(82740400003)(356005)(81166007)(82310400003)(956004)(2906002)(1076003)(36906005)(316002)(336012)(2616005)(36756003)(16526019)(26005)(186003)(7696005)(8676002)(4326008)(86362001)(8936002)(6916009)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2020 14:17:43.2874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 048e5e68-a00c-4f2a-6b95-08d87370943c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3186
Content-Type: text/plain

UEFI EDK2 on N1SDP is unable to detect FS2 during boot resulting
in launching of EDK2 shell instead of launching grub.
The startup.nsh will force launching of grub.

Change-Id: I90426f2883251b7cc5fd4aa453ccfd606640d3bd
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index 63154e3..6bd7d79 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -17,3 +17,13 @@ EDK2_ARCH          = "AARCH64"
 COMPATIBLE_MACHINE = "n1sdp"
 
 PV = "201908+git${SRCPV}"
+
+# UEFI EDK2 on N1SDP is unable to detect FS2 during boot resulting in launching of
+# EDK2 shell instead of launching grub. The startup.nsh will force launching of grub
+EFIDIR             = "/EFI/BOOT"
+EFI_BOOT_IMAGE     = "bootaa64.efi"
+
+do_deploy_append() {
+    EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
+    printf 'FS2:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" > ${DEPLOYDIR}/startup.nsh
+}
-- 
2.17.1

