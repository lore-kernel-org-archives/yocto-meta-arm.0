Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8F6C61DC2
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 15:04:48 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24135.1787670285940734064
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 08:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=U6yZaJeu;
 spf=pass (domain: est.tech, ip: 40.107.162.70, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AK37Th7JQpo/Rgj0ke7UHvu8wpyNKYSScksXrudhBwc2mcKfm4Io3eQ1U8RbLlXz/QST5OaRFghv1BZAL4R2ZvfnDq9crLs+vVvnOk3iYj6kXf/VuJj8CQfTmc9BWr08nLezRZ9WfpnyjndalPZqnRAtH6xTHRU0fxItrLfJ5TXjba2Uk2yuH0Pl1g658+ftnJfBrg0DSMfuiAtO7Lzqps/sOZ1pYLjdOVWh5Er9wD3+NEl02VaaxyEnDKzzLORjxCFrBitXa6YQB/yFm/fgQnrfMHMqopK2BtfnlOCvwHoDJkDzSxOL65gFOXEiQXtAorjYIRx8SAn2LP+9X7pSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uB+WzHojtG36KSP2zsYsXfb9qCcVHoE/pCns+OOHuGo=;
 b=nsRCQAHsdyCV5FeNHISx8pEIvY66SOomXJIBbuvJ+7zyjdsUdJ4ZCkLp/+TSxY7JjTa/crB/cbm7pLRbkPO48BfJ++6/491vd59nzHZcVlLp29eRDOi6WB2e/xiBvXEd5v9dGG0bxbbk1HXzygSxcELL/ZArPCvyWuIFsLpAign0v7m7TBDthExxMCIzHu2Nd0owRL3DlIIRimrTHtEc6gJk90dRT9wPcDtWwQk7erzqb6gxxPtTbEGSoSZkEHI8ZFSTq+pWKkZkqP8glv4EaTP+hJIRoplf6GxoXi6CrUVYIvOcdswK8aqptHHwolgRAHyyPQT6BpfSGfpcux88bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uB+WzHojtG36KSP2zsYsXfb9qCcVHoE/pCns+OOHuGo=;
 b=U6yZaJeuhQD6S36JtFioeRbw0k7clONvLZ4h2um34S/NMrvgzmxKch69Sn5T5tHXYgLoTX96oPefpru++DultpYAhFIwobb9/NBKtTrte8fV24j4dv5sG0nHyQHo9ZLoYXc/1MsvjiCz+RBmSRQ64gyLpKnD9p3/r2iZRDb989aFderwAuI0hasS8kr/idrznTDVBzcgrqdfVefMwG4XofyD5QhkReudsDbHeboVo5gOM42wNflY3rPBdrRyngB8ExhWhInbUiGkPY/Y4OC0XqJNRJ9kegHPVqXgV7AJRk6b408hL+TFPkhWP4Kth6WS0Q3F8gC5MsKW9WUweXc28w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PR3P189MB1068.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:40::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 15:04:42 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 15:04:42 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: meta-arm@lists.yoctoproject.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-arm][PATCH] meta-arm: fix trailing whitespace
Date: Tue, 25 Aug 2026 17:04:39 +0200
Message-ID: <20260825150439.64445-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::11) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PR3P189MB1068:EE_
X-MS-Office365-Filtering-Correlation-Id: bef91f3e-3b80-44be-c2d3-08df02ba313f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|10070799003|1800799024|10067099003|6133799003|18002099003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: 
	qi0SrnKN7GzDSjHgvDlKSiioQQeSlDIuRRYQAT2aWk4btUhn9YkfPIZEosH1NnkQBVty78Gj54OBgTKAOs4eH/6yJhczIvYp/pjV4TUx9NNTiceUdm2H4cCifODy0xhykfjn5lLgGm7KWpOxHHjUdgiYS5QXSctqRM0+mez2O3sVeVxUgFfYwvtgB0OljrP+AFbnEhgY7jAMMHLizgwym+NVMiEQrONSQNSj1hJeNdHZemKyvyO9c5wLmdGicRH7vFAkMZQ8rYsknIHBO1xYkPJB8IDPwMDNkIJb6CCf+nK03bb2K3sXrS102Oanv1k8s06Trwro2YJijZKHkgNj1oezI2euBCXWqrhNRjNP8mqQt/69V48aX3Nroayb4/Fjkcj0B8Nbzt5KkQKPFCIqKn6rn23d47GlmE81NsQAUIFSDkyxlfpaOIFu/Ma8a1fXHVXU3D1WgL2MgSO4bAxoWpGpGW0BWjvg5qLkPFkEpxxPHdOjc/UTntr60mMbZi/cjl6rp16VjOIGLIOlG1XVZZL8hEIaebrH2qS+TYt2kSbXzPBMZTYKnEIJG5tq0beoj+nkVGrf911eZuCi6A9SaFEgbVppYR5aXW/VmqGKDpCMSi43YGhRxk/Uqjq7MFs5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(10070799003)(1800799024)(10067099003)(6133799003)(18002099003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pXcHZKCZGJALBBGxwxujDJcVu0/1SknBMi/lorpKLu7HmrcskV4wYM12nYgF?=
 =?us-ascii?Q?evQqKjRYtVouKghstSQSstlJasC3SCo8XPtVPwnTJYedHJFxa0dBPej/KoOG?=
 =?us-ascii?Q?p5s7FsJaJAGIYkotsOYCp+LcCpmEDVYquBzdkvh84GkpUMN/w6r5jtKkjf3G?=
 =?us-ascii?Q?CltZ3Bpo7lR0iXtiVboZFSS95evEB5VT3opUZuhJCWs69WMFf7V+ojBShMw3?=
 =?us-ascii?Q?MgCVCQtWAX7yJagK839RIix3fIkNKka0vS4Qz41GtR6D2UqXajdz8hPEJqu/?=
 =?us-ascii?Q?YlziC7vdMK1zf95Rj1bpuKKPqhQWNIgixpZoekm7+iYTZEfxggdgHyv5RJ49?=
 =?us-ascii?Q?uvdOli41WDDunGI+DgK65DpJlwJYb4GIv40Ehsgl4Z4HSmS+IkDjDLOWBLRq?=
 =?us-ascii?Q?hLB7RTdJSmxMDfbma8PwUSuMZ0gcl+XxastA81i/kro3miV1s0e4igkshafi?=
 =?us-ascii?Q?AqJ0yR5ZsZNNpfWw6B3stSrvFny8KyTN+/Yi3ZGzrfIb1qRvDIalM5Kclo/B?=
 =?us-ascii?Q?z9U08cgHS/xdxMbTSK/c6lUnSvus0ipcCO5Dr6tP2zjdLHaUPNE9DK+7IUV/?=
 =?us-ascii?Q?DQu+EKV4lSZ19QqbTM0j+4o6P0Q8sVpySLMbXS0MNTyJ2x8/vp3iS30vGtuH?=
 =?us-ascii?Q?WLXIXv3f78+GmyhUAQ+2rHMiK4EWqHP6kMoqRx1qX883djQOKg0/tojKi9Uw?=
 =?us-ascii?Q?jOdBUNuN7nrpBkwJPonR79QivkytKf8HO7qkV1zDX6/Ol7WJbAOFVdvdwkmd?=
 =?us-ascii?Q?eW8Mg5aLbVfECLszOvyzyMfmCKkiHeyODsGpmdvXKSVma21kgSW3m7GXIMyT?=
 =?us-ascii?Q?y3pH/VefT/MOsugbuIyDAoBrBDGN2NR0GMNR01P8bibO/BT6CsZgI++hU4rS?=
 =?us-ascii?Q?Ke4DWtvCaiqzm2QCFDo29wpBLl+WeMjhffGzK1j1CAHe82NwjDchvPZSFk42?=
 =?us-ascii?Q?4i7Sbo/rhUfVh73Solwf2suA8YWvJTNN/ZXUOSJ8RqGh+naJBHcF2J9HCGnz?=
 =?us-ascii?Q?aHtnZydWZ55v985m9SLMSKfuZ56Y9ZXv5bk0vhwfmCWtjD7wnJhvJQ2q54JW?=
 =?us-ascii?Q?5oX7zy8FrIpnT1I3aX23S9Cn32w8wzYBKS80rjxjMgk2MYD9h9tE5Uefy03L?=
 =?us-ascii?Q?TaMWCexzRQTOixZr4XEYSlEz51nRV+b5KrLjvjdaTjhetOXsuYwrlfq6RYf4?=
 =?us-ascii?Q?Symv3MNaF/pL+9SLeVTqD0vfHvMNpsiGZ21Byg9Lvpx9Bz3ei7rnJVR5PEIo?=
 =?us-ascii?Q?y701XuxrKO1Xb33Kl74agC8fI9u2R2s2Xg+brxY+n1c/sLsgz0NKimhzDn2Y?=
 =?us-ascii?Q?Q4aaowYJK6opQBASSt7zjO4pUj3OrOJOJwYkvkVjhoqsvPhrTe8kexFo5ZE0?=
 =?us-ascii?Q?6kMAxXrDKGBXgu/UiNCDjoZKes1LLkvjld9fXZIZQLK/CeKwTwVCoTqTBo5p?=
 =?us-ascii?Q?iTpc2Ku9yhq8W9u3HB6OX9vCfFj6rS76i2RIXTVVVNv6UWW4lVeX5On5FeM3?=
 =?us-ascii?Q?dgVTzzacKTJ+Db+d2dyXRVCbQ68daQj8s8OaiNvAZhUsqC+TZnrFklDSBufg?=
 =?us-ascii?Q?N7PXe3MILmWywF3xrmpAwGxW+rHfPR8Ksx6cxxYRrdiHgtbxE2aUZ2ZVlsNP?=
 =?us-ascii?Q?KGyw8kUx987e34cjGBoV5XF/O5X5FrCKQP7VsRdISoVjyPkMEHE7gaK+xCh6?=
 =?us-ascii?Q?cI8VQ52rcD4sCgyoMAymVUw4F3gJYoBKRUpK9p0TUfcieXGqvMLInsIvI79V?=
 =?us-ascii?Q?h7YfpnWR1S+A/zrDyXuHWo/I5RbhSlsJxSB+5xqV7RWSqoshlnAKjYgfI9TM?=
X-MS-Exchange-AntiSpam-MessageData-1: KAQ2MEIbpa3WtWKUU2d8+dsAW2/+AKMoCVs=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bef91f3e-3b80-44be-c2d3-08df02ba313f
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 15:04:42.4235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aySdcVPSn5+2Oxi23iCC9EOQ1W/E8k6er6SzG0gxPQdubaWhiF8/DZcNjy70qGhqlE2gIXpLJUsKmE8j2e6EhDD9Byp9CV1IF/9s8eXomiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1068
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Aug 2026 15:04:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7142

Bitbake now warns about trailing whitespace in parsed metadata lines.
Fix the affected files to silence the warnings during parsing.

Reported on:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/4317/ste=
ps/16/logs/warnings

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../external-arm-toolchain/arm-binary-toolchain.inc             | 2 +-
 meta-arm/recipes-security/trusted-services/libpsats_git.bb      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm=
-binary-toolchain.inc b/meta-arm-toolchain/recipes-devtools/external-arm-to=
olchain/arm-binary-toolchain.inc
index c77d339..e8982a4 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary=
-toolchain.inc
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary=
-toolchain.inc
@@ -26,6 +26,6 @@ PRIVATE_LIBS =3D "libgcc_s.so.1 libstdc++.so.6"
 BBCLASSEXTEND =3D "native nativesdk"
=20
 # Skipping file deps - we don't control the dependencies for prebuilt libr=
aries, resulting in
-# nothing provides libcrypt.so.1()(64bit) needed by nativesdk-gcc-arm-none=
-eabi=20
+# nothing provides libcrypt.so.1()(64bit) needed by nativesdk-gcc-arm-none=
-eabi
 # when packaged as RPM for SDK.
 SKIP_FILEDEPS =3D "1"
diff --git a/meta-arm/recipes-security/trusted-services/libpsats_git.bb b/m=
eta-arm/recipes-security/trusted-services/libpsats_git.bb
index 952203f..c6b9a88 100644
--- a/meta-arm/recipes-security/trusted-services/libpsats_git.bb
+++ b/meta-arm/recipes-security/trusted-services/libpsats_git.bb
@@ -20,7 +20,7 @@ do_install:append () {
         sed -i -e "s#/${TS_ENV}##g" $target_cmake
     fi
=20
-    # Remove files installed by libts too.=20
+    # Remove files installed by libts too.
     rm ${D}${TS_INSTALL}/include/util.h
     rm ${D}${TS_INSTALL}/include/compiler.h
 }

