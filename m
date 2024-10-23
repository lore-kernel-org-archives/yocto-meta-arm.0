Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596B1CF5390
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 14:22:42 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.67])
 by mx.groups.io with SMTP id smtpd.web10.10199.1729693354416890284
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Oct 2024 07:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Z8yIKOa0;
 spf=pass (domain: oss.nxp.com, ip: 40.107.104.67, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArsPuS/qS2O0tFobfBh1mxCcONZhPKdt14eEr/hvAtX5ZytNBXtHL8rLwWPlzr5nXWkeEhQxo0eJdWcvQfVsOSoFlIGKmPrbD2dqKczW6qUb9bKEFRzk7BRuXrJ2kL6YIPPIflQflgVSOFK4BHPDriYddEmCCc/JDvqXb1eJ0OrujKzgLfkiNjC/d6dnZPHA3uej2DokaTFhXfCXOfOXb6drXx8vF2E2iw+MImAZdg12s1intN+tSedHzqo8Q7G1u2SQ8AM2UsdInO5A3PJgDzAmw6skMvrLkJ00Gs5CvOBzdyITd62/85NMg2ds6RSv9Ia9dtTE2Ldi6lPOTcsF3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/bQY8cN3kDYglDeON0zTbF7sX/UIHx0k26bvz44M9E=;
 b=gHdAFR1Y1yGCIXZ3BPXxCCWuQzFbt2/81hTxgBtlUPE61U34NxkX7LOOKShdGmURtAYsVyhT9seNXqg+Z0mjPF1WZlgez2LoiBP7KtiVbzESY2mB+QPcv13OrVdnDrbNP5PDwYCQzHXyn1DjAaxB58O7fA/ouyOKEcbXy+D6d0+T128XfQnxry38Ie3Si0JKFAw8uIP5/5Tcpo+n0dnNczwFWUTXZJu9kXdf8uvAfbsROKDA2YB2TaWuSfEcWfuA6wklkDlt5oyaNow+/xHC5EOrzOil5F7921J+nXp7uaszHO5WA9IfSqtH3oFGZixr4Slr1UOMarGxsHAWZOPYFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/bQY8cN3kDYglDeON0zTbF7sX/UIHx0k26bvz44M9E=;
 b=Z8yIKOa0WcQTVHUKN6OLjbigsyaX2U11EpixaTZ1jI+2S5oAJqglBl1Yt/MS1sH3mBV3WMdUbsXJhoO1UJ9FmfWjulD6dYlPhUo8qP1TqLw0HSa0jOBXM2puluhXZ2dMWRpvSgRuNZ9uEzxoo22MC26NtP5Zg3cCCXwAGhi8Mzb8pKFYuCfA94a2+HsUu/Y/jN1TEiMvJF4ibHfCFQDO5cWE9lyoeJIIT+rFN1nQ7kRcPUNnFeEYBh10B0i84DcMV1Y4fcq3WDUXnOaGT6Uxt2gqnZXGvhf3ymSnfaRC0dB2TvvVIqFMAYJJdsw21OkaEoQAr4NGs/NOqYaDU3Fa8w==
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU2PR04MB9084.eurprd04.prod.outlook.com (2603:10a6:10:2f3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 23 Oct
 2024 14:22:30 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 14:22:30 +0000
From: "Tom Hochstein (OSS)" <tom.hochstein@oss.nxp.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>
CC: Tom Hochstein <tom.hochstein@nxp.com>, Sahil Malhotra
	<sahil.malhotra@nxp.com>
Subject: RE: [PATCH v3 1/2] optee-client: use udev rule and systemd service
 from upstream
Thread-Topic: [PATCH v3 1/2] optee-client: use udev rule and systemd service
 from upstream
Thread-Index: AQHbIGIclZpTCywzPEydZ5tHUxAEvLKUbPsw
Date: Wed, 23 Oct 2024 14:22:30 +0000
Message-ID: 
 <PAXPR04MB9448F0D1DE0F84A6634EFBC5E24D2@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <20241017065907.172504-1-mikko.rapeli@linaro.org>
In-Reply-To: <20241017065907.172504-1-mikko.rapeli@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|DU2PR04MB9084:EE_
x-ms-office365-filtering-correlation-id: e9ca31be-a481-4c9a-5270-08dcf36e20db
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?s8OZLXZ/5ptHEVmOTRmDvM4vVpqtxbdmErw1/DLH3xewFuX8rX5i8tlmF6pw?=
 =?us-ascii?Q?uD4z7VmCpJ1eyMufa+3g8koivJDnOYn96kd9+buodZVmn2+lgmskV50UtG01?=
 =?us-ascii?Q?hNCh40pKlap3posf1C6/VhMV2V9Zi6Ij1zsPAB8ys+nxiQsm/ktkQOZuurSr?=
 =?us-ascii?Q?6k3egU2KU6oKA7daGEIEJHxMAvEA0qZVUqcqTzUurPcstZRUaEYYhbnduEG6?=
 =?us-ascii?Q?5Egl5DuPD6FXed6Cf0CokS7tF0cvaxTkRavswi3Xtc/f4R/K6mSZUe9xqHg9?=
 =?us-ascii?Q?2d3pmkLJxoshUC8ywhkw3V/XcKNY6u2+YXLDlpOaIVALxcx+PDDwMxf+DPlF?=
 =?us-ascii?Q?3QzkyeoVxmqoKkXnb+DWE0Nz+mjYL1mtmKCcjz9ZQ/pA7Hnx47LW8KzKjN+K?=
 =?us-ascii?Q?nZxa8qLHt5N0zYC116Cct6DS5zSsLYekMIIA7bkOPLjfUCmEvk5oHxZDS54D?=
 =?us-ascii?Q?DfYMdV8CLEUbiF/8yXVSUavn8UuAYPc59I0lnhpyaH9DCbebwdz5z+e6kjyb?=
 =?us-ascii?Q?4bXQ+NzpXd2DSNj14V3mZLJeh03wjLuvp0Exfu+jUza8wIvW4EqIT3UyQvHb?=
 =?us-ascii?Q?LmsthvBo6QuRAhF0svlMYdml97iK4QnWRUmiwgJw6lV4gnrTF5VHhNYM1JtU?=
 =?us-ascii?Q?aHed1eR+oJwI+mBOzEByyqKpikJQQbiLBIdUKzqV3Vk9OpYLDl8wJSPv4kFG?=
 =?us-ascii?Q?+M8oPgEoFuNIv1GVnN81CyU4kVseWibqubObtaenkQ8A1UQ07vwItzvCDb6k?=
 =?us-ascii?Q?HdX7aEICSVL+uBwoImrgxiK5TWHeL7Ozkk3DQRHnqR5QNI2TW2JqCdBhShRW?=
 =?us-ascii?Q?DnNOG5x/Wd19jQ0y8QvMTR2roxr/Y7qkiZuSncxFoPrlvMeqOik8kBZIwSVP?=
 =?us-ascii?Q?MpcJCekmgyaDqxUNBecMghKM1QAz56m3qEKdXfeET8SS9TezCczeGiUT9f9E?=
 =?us-ascii?Q?o2yDVdLoAnICanw8yOvX/8lHGwlh7eWbtOek3AxDiP5xT1tWCaU6xLz8XSWb?=
 =?us-ascii?Q?NkTf3O7oRWZN/e7Th5jm+4hwVbr16cG39BM2aJb7ySPa9Iv09Yvp9NCu2b1n?=
 =?us-ascii?Q?R6b7TSZ2QeAAkT7vQPLLrc5pdONlszEJQGugmEVjiqSfptUR3JEe+WJ8RvPz?=
 =?us-ascii?Q?JRIWHPSct7H6jXjrOiNsS2/Sfiwhxg0NZ+s86yHqEUpNmkL8W9ei+l6/ny3y?=
 =?us-ascii?Q?ZeTo6TuHdhHI8urJpP0Z9J+jzXkvQbWP+DhvQjl8wbfsixSjWHptLfIzCFvw?=
 =?us-ascii?Q?6rbIkZ/RcDd/mES6sKsXb5R+VCjIBHpOqtn3toiZCnn3yAA2qYUPx/Cl0b0Y?=
 =?us-ascii?Q?158fukLRvo85SOmSITlueJTS?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DY68Xr80u8pN8zqQ6Nf4fipFukS/7eP6a2kT4R6N+DpkSQ9DWAy1e8DkEscR?=
 =?us-ascii?Q?9KRCOQK/7gB83QDnVHMEm6x/+2SGHnsjPpgQ1nKC9mvgvLznjLa2857suklN?=
 =?us-ascii?Q?ZbERBlyVMuPSVCg6tSRlZz4tfdjU4RJ4xcvZDodsHI/agNvV6bzHOybFsIVd?=
 =?us-ascii?Q?v62ZOFmIz2EDxta4fDI9l9neyyJUr0hlkPFb4FZiBtntdFtSRAmz40uRfyTx?=
 =?us-ascii?Q?I2HIBj5pt8qp8YhQ7OSsQ9UWpuelbINC9wUe0yvQuhmmPrw/OJibZMrPiegv?=
 =?us-ascii?Q?ZSVg6b/jqBUi4yUsWgNSnydj1Z71Va5t4ggZJ3L52i6uvRrnGeam7CWZBKN8?=
 =?us-ascii?Q?m/Q7l+yJD7pnRrCT8xhpx37U5lDu3n0Q+Lp89j3t+2lC5mKJ1Ll6NVMiuvsa?=
 =?us-ascii?Q?xmGWSKHpyi6k6onYeI6SYprNWOYFJ5cJMdbaw9PuFhaUxeOzT2QXQBBZsNJe?=
 =?us-ascii?Q?jvLx4ZyeAO+MQCwK82BPC3HFkpwxNIzvir/owDYfHqmMkmB0s4W95sqJP80+?=
 =?us-ascii?Q?DPu1HEG70uPI0LxWZ3onlW8jPBamhpvKWTTdXAw7D8AEdRcL92z9sPX+lJxe?=
 =?us-ascii?Q?KEKUKflNkJKcrnUCOOLLsN/4ZFuKi4kmVPmnQ+bPfIdHQ4KkinADT7l3/1FV?=
 =?us-ascii?Q?UTy/I7cGlLub2ce1Z+KgDqkgVFHpV3y2hSF6rxWQ8xWqskQKtbMNojYDwfN8?=
 =?us-ascii?Q?E+PGna1TivQZpnyr00xhBb2JGXOpz6FQzycdaukWrqmJl+zo3vjupQk87R17?=
 =?us-ascii?Q?xVvSdeTK/Cl14hkXZgo9fAZI4rwQAyp8ppt6Mcf5MUOsvpBgo0ssPyFio+XT?=
 =?us-ascii?Q?Z/Z1A0icn3/fEvVObkjmOoaVpXqEuLrK3mueD8XNcR3ArWioSjoayCWSE6Db?=
 =?us-ascii?Q?oO5//5hJJY/ps2z+zTU7bZdd8Zuugi32DwBK0Y1YPr6/Mr1Vj3zqF0KSJ9gr?=
 =?us-ascii?Q?ySNzRNySCr5T/Ys0oSsCYXYEoEvXgCHZMl18+SM4mqiyzPDRH7BIoY38y8u+?=
 =?us-ascii?Q?+mEBznu7ehdPj2/VS0gD0jr5nuce8YYSmCebUButZeifOs4x8X3jOo8dGWTw?=
 =?us-ascii?Q?cRgwnx2JkDS3VcsPy3rImjF54Kpwzp48nggPpUV+vzTrA3y1NtFAU77BC6AA?=
 =?us-ascii?Q?4NYK6AHcCmJLE30CZ3+C72bIE2+UUzj70t/QT/gS5Tk6ajXWLKLcmfXzHvvd?=
 =?us-ascii?Q?axJpUgMD/JbxFem7ZOYRlz2z8eFQkyw2YNBW9r+nkNqUbP3smwrAxUQp5QvK?=
 =?us-ascii?Q?JzDSNAgYgvtFiYyPpcvUbPwJ4BsLoyL0KpZy84T0AXXvrqNJFmQhuSo9bw5A?=
 =?us-ascii?Q?MmMoU6gddvuyccw96Rr+ByaqAbAqxQo8k3u3pxhrhkGvU4/tglOiCZXSXajA?=
 =?us-ascii?Q?ztIN8Phq63Cp9raE4FWP8cFwQQiC0QGX+t54XRJpN1Hojw9A/CTgh3JhDnSe?=
 =?us-ascii?Q?hWgOj4JBjybGDhsGFk/DKBZ3DDbltH2mQPtoWh4x5rLlXMxUAm9Rh21/UGLD?=
 =?us-ascii?Q?A4GsLHFXT1Ymd6gN6o1BsHzDHl78CQWFMuo5iVhvGc6Q0nA4B+mqNo4BRYP6?=
 =?us-ascii?Q?ukM0wnboENmdOi0oauVcV29xKHEF7AniZpDBpxSj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ca31be-a481-4c9a-5270-08dcf36e20db
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 14:22:30.2360
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HEp6Oz5aJOuU48tzthjtj+fr7znrN85JpQqDCFa/zOZjTR3FP5Z87BJ+greX4G0GtpGNmYqRrXkB16w1rkwRdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9084
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Oct 2024 14:22:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6220

Hi Mikko,

We have multilib testing that is failing now because the systemd folder is =
being installed in `libdir` instead of the non-arch-specific `systemd_syste=
m_unitdir =3D "${nonarch_base_libdir}/systemd/system"` as is codified in `b=
itbake.conf`.

ERROR: optee-client-4.4.0.imx-r0 do_package: QA Issue: optee-client: Files/=
directories were installed but not shipped in any package:
  /usr/lib64/systemd
  /usr/lib64/systemd/system
  /usr/lib64/systemd/system/tee-supplicant@.service

I'm not sure how this should be fixed, as it doesn't appear that CMAKE can =
handle more than one libdir. Can the install of the service file be hard-co=
ded to use /usr/lib? Or does this need to be fixed in the recipe?

Tom

-----Original Message-----
From: Mikko Rapeli <mikko.rapeli@linaro.org>
Sent: Thursday, October 17, 2024 1:59 AM
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>; Tom Hochstein <tom.hochstein@nx=
p.com>; Sahil Malhotra <sahil.malhotra@nxp.com>
Subject: [PATCH v3 1/2] optee-client: use udev rule and systemd service fro=
m upstream

Use backported upstream patch for udev rule and systemd service file.
sysvinit script is still used from meta-arm. Don't install systemd
service without systemd distro feature, other way round for
sysvinit script.

tee-supplicant started by systemd service runs as non-root teesuppl
user with teepriv group. sysvinit still runs as root since busybox
start-stop-daemon doesn't support -g group parameter and -u teesuppl
doesn't seem to change the effective user.

udev rules allow non-root /dev/tee* access from tee and
/dev/teepriv* access from teepriv groups.

Tested sysvinit changes with:

$ kas build ci/qemuarm64-secureboot.yml:ci/poky.yml:ci/testimage.yml

and systemd changes with:

$ kas build ci/qemuarm64-secureboot.yml:ci/poky.yml:ci/testimage.yml:ci/uef=
i-secureboot.yml

Cc: tom.hochstein@nxp.com
Cc: sahil.malhotra@nxp.com
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../recipes-security/optee/optee-client.inc   |  30 +--
 ...dd-udev-rule-and-systemd-service-fil.patch | 186 ++++++++++++++++++
 .../optee/optee-client/optee-udev.rules       |   6 -
 .../optee-client/tee-supplicant@.service      |  13 --
 .../optee/optee-client_4.3.0.bb               |   2 +
 5 files changed, 205 insertions(+), 32 deletions(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-client/0001-tee-s=
upplicant-add-udev-rule-and-systemd-service-fil.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-client/optee-udev=
.rules
 delete mode 100644 meta-arm/recipes-security/optee/optee-client/tee-suppli=
cant@.service

diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/re=
cipes-security/optee/optee-client.inc
index f387c805..fc48c302 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -9,9 +9,7 @@ inherit systemd update-rc.d cmake useradd

 SRC_URI =3D " \
     git://github.com/OP-TEE/optee_client.git;branch=3Dmaster;protocol=3Dht=
tps \
-    file://tee-supplicant@.service \
     file://tee-supplicant.sh \
-    file://optee-udev.rules \
 "

 UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+(\.\d+)+)$"
@@ -20,20 +18,21 @@ S =3D "${WORKDIR}/git"

 EXTRA_OECMAKE =3D " \
     -DBUILD_SHARED_LIBS=3DON \
-    -DCFG_TEE_FS_PARENT_PATH=3D'${localstatedir}/lib/tee' \
 "
 EXTRA_OECMAKE:append:toolchain-clang =3D " -DCFG_WERROR=3D0"

 do_install:append() {
-    install -D -p -m0644 ${UNPACKDIR}/tee-supplicant@.service ${D}${system=
d_system_unitdir}/tee-supplicant@.service
-    install -D -p -m0755 ${UNPACKDIR}/tee-supplicant.sh ${D}${sysconfdir}/=
init.d/tee-supplicant
-    install -d ${D}${sysconfdir}/udev/rules.d
-    install -m 0644 ${UNPACKDIR}/optee-udev.rules ${D}${sysconfdir}/udev/r=
ules.d/optee.rules
-
-    sed -i -e s:@sysconfdir@:${sysconfdir}:g \
-           -e s:@sbindir@:${sbindir}:g \
-              ${D}${systemd_system_unitdir}/tee-supplicant@.service \
-              ${D}${sysconfdir}/init.d/tee-supplicant
+    # installed by default
+    if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
+        rm -rf ${D}${libdir}/systemd
+    fi
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false'=
, d)}; then
+        install -D -p -m0755 ${UNPACKDIR}/tee-supplicant.sh ${D}${sysconfd=
ir}/init.d/tee-supplicant
+        sed -i -e s:@sysconfdir@:${sysconfdir}:g \
+               -e s:@sbindir@:${sbindir}:g \
+                  ${D}${sysconfdir}/init.d/tee-supplicant
+    fi
+    install -o teesuppl -g teesuppl -m 0700 -d ${D}${localstatedir}/lib/te=
e
 }

 SYSTEMD_SERVICE:${PN} =3D "tee-supplicant@.service"
@@ -42,5 +41,10 @@ INITSCRIPT_PACKAGES =3D "${PN}"
 INITSCRIPT_NAME:${PN} =3D "tee-supplicant"
 INITSCRIPT_PARAMS:${PN} =3D "start 10 1 2 3 4 5 . stop 90 0 6 ."

+# Users and groups:
+# tee group to access /dev/tee*
+# teepriv group to acess /dev/teepriv*, only tee-supplicant
+# teesuppl user and group teesuppl to run tee-supplicant
 USERADD_PACKAGES =3D "${PN}"
-GROUPADD_PARAM:${PN} =3D "--system teeclnt"
+GROUPADD_PARAM:${PN} =3D "--system tee; --system teepriv; --system teesupp=
l"
+USERADD_PARAM:${PN} =3D "--system -g teesuppl --groups teepriv --home-dir =
${localstatedir}/lib/tee -M --shell /sbin/nologin teesuppl;"
diff --git a/meta-arm/recipes-security/optee/optee-client/0001-tee-supplica=
nt-add-udev-rule-and-systemd-service-fil.patch b/meta-arm/recipes-security/=
optee/optee-client/0001-tee-supplicant-add-udev-rule-and-systemd-service-fi=
l.patch
new file mode 100644
index 00000000..18c0d950
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client/0001-tee-supplicant-add-=
udev-rule-and-systemd-service-fil.patch
@@ -0,0 +1,186 @@
+From bf0d02758696ee7a9f7af9e95f85f5c238d0e109 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Wed, 2 Oct 2024 15:24:21 +0100
+Subject: [PATCH] tee-supplicant: add udev rule and systemd service file
+
+tee-supplicant startup with systemd init based
+is non-trivial. Add sample udev rule and systemd
+service files here so that distros can co-operate maintaining
+them.
+
+Files are from meta-arm https://git.yoctoproject.org/meta-arm
+at commit 7cce43e632daa8650f683ac726f9124681b302a4 with license
+MIT and authors:
+
+Peter Griffin <peter.griffin@linaro.org>
+Joshua Watt <JPEWhacker@gmail.com>
+Javier Tia <javier.tia@linaro.org>
+Mikko Rapeli <mikko.rapeli@linaro.org>
+
+With permission from the authors, files can be relicensed to
+BSD-2-Clause like rest of optee client repo.
+
+The config files expect to find tee and teepriv system groups
+and teesuppl user and group (part of teepriv group) for running
+tee-supplicant. Additionally state directory /var/lib/tee
+must be owned by teesuppl user and group with no rights
+to other users. The groups and user can be changed via
+CMake variables:
+
+CFG_TEE_GROUP
+CFG_TEEPRIV_GROUP
+CFG_TEE_SUPPL_USER
+CFG_TEE_SUPPL_GROUP
+
+Change storage path from /data to /var/lib and
+use standard CMake variables also for constructing install
+paths which can be override to change the defaults:
+
+CMAKE_INSTALL_PREFIX, e.g. /
+CMAKE_INSTALL_LIBDIR, e.g. /usr/lib
+CMAKE_INSTALL_LOCALSTATEDIR /var
+
+Once these are setup, udev will start tee-supplicant in initramfs
+or rootfs with teesuppl user and group when /dev/teepriv
+device appears. The systemd service starts before tpm2.target
+(new in systemd 256) which starts early in initramfs and in main rootfs.
+This covers firmware TPM TA usecases for main rootfs encryption. When
+stopping tee-supplicant, the ftpm kernel modules are removed and only
+then the main process stopped to avoid fTPM breakage. These workarounds
+may be removed once RPMB kernel and optee patches without tee-supplicant
+are merged (Linux kernel >=3D 6.12-rc1, optee_os latest master or >=3D 4.4=
).
+
+Tested on yocto meta-arm setup which runs fTPM and optee-test/xtest
+under qemuarm64:
+
+$ git clone https://git.yoctoproject.org/meta-arm
+$ cd meta-arm
+$ SSTATE_DIR=3D$HOME/sstate DL_DIR=3D$HOME/download kas build \
+ci/qemuarm64-secureboot.yml:ci/poky-altcfg.yml:ci/testimage.yml
+
+Compiled image can be manually started to qemu serial console with:
+
+$ SSTATE_DIR=3D$HOME/sstate DL_DIR=3D$HOME/download kas shell \
+ci/qemuarm64-secureboot.yml:ci/poky-altcfg.yml:ci/testimage.yml
+$ runqemu slirp nographic
+
+meta-arm maintainers run these tests as part of their CI.
+
+Note that if the tee-supplicant state directory /var/lib/tee
+can not be accessed due permissions or other problems, then
+tee-supplicant startup with systemd still works. Only optee-test/xtest
+will be failing and fTPM kernel drivers fail to load with error
+messages.
+
+Cc: Peter Griffin <peter.griffin@linaro.org>
+Cc: Joshua Watt <JPEWhacker@gmail.com>
+Cc: Javier Tia <javier.tia@linaro.org>
+Acked-by: Jerome Forissier <jerome.forissier@linaro.org>
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ config.mk                                 |  2 +-
+ libteec/CMakeLists.txt                    |  2 +-
+ tee-supplicant/CMakeLists.txt             | 13 +++++++++++--
+ tee-supplicant/optee-udev.rules.in        |  7 +++++++
+ tee-supplicant/tee-supplicant@.service.in | 17 +++++++++++++++++
+ 5 files changed, 37 insertions(+), 4 deletions(-)
+ create mode 100644 tee-supplicant/optee-udev.rules.in
+ create mode 100644 tee-supplicant/tee-supplicant@.service.in
+
+Upstream-Status: Backport
+
+diff --git a/config.mk b/config.mk
+index eae481f..3def087 100644
+--- a/config.mk
++++ b/config.mk
+@@ -23,7 +23,7 @@ CFG_TEE_SUPP_LOG_LEVEL?=3D1
+ #   This folder can be created with the required permission in an init
+ #   script during boot, else it will be created by the tee-supplicant on
+ #   first REE FS access.
+-CFG_TEE_FS_PARENT_PATH ?=3D /data/tee
++CFG_TEE_FS_PARENT_PATH ?=3D /var/lib/tee
+
+ # CFG_TEE_CLIENT_LOG_FILE
+ #   The location of the client log file when logging to file is enabled.
+diff --git a/libteec/CMakeLists.txt b/libteec/CMakeLists.txt
+index c742d31..c857369 100644
+--- a/libteec/CMakeLists.txt
++++ b/libteec/CMakeLists.txt
+@@ -14,7 +14,7 @@ endif()
+ # Configuration flags always included
+ #########################################################################=
#######
+ set(CFG_TEE_CLIENT_LOG_LEVEL "1" CACHE STRING "libteec log level")
+-set(CFG_TEE_CLIENT_LOG_FILE "/data/tee/teec.log" CACHE STRING "Location o=
f libteec log")
++set(CFG_TEE_CLIENT_LOG_FILE "${CMAKE_INSTALL_LOCALSTATEDIR}/lib/tee/teec.=
log" CACHE STRING "Location of libteec log")
+
+ #########################################################################=
#######
+ # Source files
+diff --git a/tee-supplicant/CMakeLists.txt b/tee-supplicant/CMakeLists.txt
+index 54a34c7..8df9bef 100644
+--- a/tee-supplicant/CMakeLists.txt
++++ b/tee-supplicant/CMakeLists.txt
+@@ -11,10 +11,15 @@ option(CFG_TEE_SUPP_PLUGINS "Enable tee-supplicant plu=
gin support" ON)
+ set(CFG_TEE_SUPP_LOG_LEVEL "1" CACHE STRING "tee-supplicant log level")
+ # FIXME: Question is, is this really needed? Should just use defaults fro=
m # GNUInstallDirs?
+ set(CFG_TEE_CLIENT_LOAD_PATH "/lib" CACHE STRING "Colon-separated list of=
 paths where to look for TAs (see also --ta-dir)")
+-set(CFG_TEE_FS_PARENT_PATH "/data/tee" CACHE STRING "Location of TEE file=
system (secure storage)")
++set(CFG_TEE_FS_PARENT_PATH "${CMAKE_INSTALL_LOCALSTATEDIR}/lib/tee" CACHE=
 STRING "Location of TEE filesystem (secure storage)")
+ # FIXME: Why do we have if defined(CFG_GP_SOCKETS) && CFG_GP_SOCKETS =3D=
=3D 1 in the c-file?
+ set(CFG_GP_SOCKETS "1" CACHE STRING "Enable GlobalPlatform Socket API sup=
port")
+-set(CFG_TEE_PLUGIN_LOAD_PATH "/usr/lib/tee-supplicant/plugins/" CACHE STR=
ING "tee-supplicant's plugins path")
++set(CFG_TEE_PLUGIN_LOAD_PATH "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIB=
DIR}/${PROJECT_NAME}/plugins/" CACHE STRING "tee-supplicant's plugins path"=
)
++
++set(CFG_TEE_GROUP "tee" CACHE STRING "Group which has access to /dev/tee*=
 devices")
++set(CFG_TEEPRIV_GROUP "teepriv" CACHE STRING "Group which has access to /=
dev/teepriv* devices")
++set(CFG_TEE_SUPPL_USER "teesuppl" CACHE STRING "User account which tee-su=
pplicant is started with")
++set(CFG_TEE_SUPPL_GROUP "teesuppl" CACHE STRING "Group account which tee-=
supplicant is started with")
+
+ if(CFG_TEE_SUPP_PLUGINS)
+       set(CMAKE_INSTALL_RPATH "${CFG_TEE_PLUGIN_LOAD_PATH}")
+@@ -113,3 +118,7 @@ endif()
+ # Install targets
+ #########################################################################=
#######
+ install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION ${CMAKE_INSTALL_SBIND=
IR})
++configure_file(tee-supplicant@.service.in tee-supplicant@.service @ONLY)
++install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/tee-supplicant@.service=
 DESTINATION ${CMAKE_INSTALL_LIBDIR}/systemd/system)
++configure_file(optee-udev.rules.in optee-udev.rules @ONLY)
++install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/optee-udev.rules DESTIN=
ATION ${CMAKE_INSTALL_SYSCONFDIR}/udev/rules.d)
+diff --git a/tee-supplicant/optee-udev.rules.in b/tee-supplicant/optee-ude=
v.rules.in
+new file mode 100644
+index 0000000..275e833
+--- /dev/null
++++ b/tee-supplicant/optee-udev.rules.in
+@@ -0,0 +1,7 @@
++# SPDX-License-Identifier: BSD-2-Clause
++KERNEL=3D=3D"tee[0-9]*", MODE=3D"0660", OWNER=3D"root", GROUP=3D"@CFG_TEE=
_GROUP@", TAG+=3D"systemd"
++
++# If a /dev/teepriv[0-9]* device is detected, start an instance of
++# tee-supplicant.service with the device name as parameter
++KERNEL=3D=3D"teepriv[0-9]*", MODE=3D"0660", OWNER=3D"root", GROUP=3D"@CFG=
_TEEPRIV_GROUP@", \
++    TAG+=3D"systemd", ENV{SYSTEMD_WANTS}+=3D"tee-supplicant@%k.service"
+diff --git a/tee-supplicant/tee-supplicant@.service.in b/tee-supplicant/te=
e-supplicant@.service.in
+new file mode 100644
+index 0000000..e53a935
+--- /dev/null
++++ b/tee-supplicant/tee-supplicant@.service.in
+@@ -0,0 +1,17 @@
++# SPDX-License-Identifier: BSD-2-Clause
++[Unit]
++Description=3DTEE Supplicant on %i
++DefaultDependencies=3Dno
++After=3Ddev-%i.device
++Wants=3Ddev-%i.device
++Conflicts=3Dshutdown.target
++Before=3Dtpm2.target sysinit.target shutdown.target
++
++[Service]
++Type=3Dnotify
++User=3D@CFG_TEE_SUPPL_USER@
++Group=3D@CFG_TEE_SUPPL_GROUP@
++EnvironmentFile=3D-@CMAKE_INSTALL_SYSCONFDIR@/default/tee-supplicant
++ExecStart=3D@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_SBINDIR@/tee-supplicant=
 $OPTARGS
++# Workaround for fTPM TA: stop kernel module before tee-supplicant
++ExecStop=3D-/bin/sh -c "/sbin/modprobe -v -r tpm_ftpm_tee ; /bin/kill $MA=
INPID"
+--
+2.34.1
+
diff --git a/meta-arm/recipes-security/optee/optee-client/optee-udev.rules =
b/meta-arm/recipes-security/optee/optee-client/optee-udev.rules
deleted file mode 100644
index 075f469c..00000000
--- a/meta-arm/recipes-security/optee/optee-client/optee-udev.rules
+++ /dev/null
@@ -1,6 +0,0 @@
-KERNEL=3D=3D"tee[0-9]*", MODE=3D"0660", OWNER=3D"root", GROUP=3D"teeclnt",=
 TAG+=3D"systemd"
-
-# If a /dev/teepriv[0-9]* device is detected, start an instance of
-# tee-supplicant.service with the device name as parameter
-KERNEL=3D=3D"teepriv[0-9]*", MODE=3D"0660", OWNER=3D"root", GROUP=3D"teecl=
nt", \
-    TAG+=3D"systemd", ENV{SYSTEMD_WANTS}+=3D"tee-supplicant@%k.service"
diff --git a/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.s=
ervice b/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.servi=
ce
deleted file mode 100644
index e3039fde..00000000
--- a/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=3DTEE Supplicant on %i
-DefaultDependencies=3Dno
-After=3Ddev-%i.device
-Wants=3Ddev-%i.device
-Conflicts=3Dshutdown.target
-Before=3Dtpm2.target sysinit.target shutdown.target
-
-[Service]
-Type=3Dnotify
-EnvironmentFile=3D-@sysconfdir@/default/tee-supplicant
-ExecStart=3D@sbindir@/tee-supplicant $OPTARGS
-ExecStop=3D-/bin/sh -c "/sbin/modprobe -v -r tpm_ftpm_tee ; /bin/kill $MAI=
NPID"
diff --git a/meta-arm/recipes-security/optee/optee-client_4.3.0.bb b/meta-a=
rm/recipes-security/optee/optee-client_4.3.0.bb
index 4a088004..edab4583 100644
--- a/meta-arm/recipes-security/optee/optee-client_4.3.0.bb
+++ b/meta-arm/recipes-security/optee/optee-client_4.3.0.bb
@@ -2,6 +2,8 @@ require recipes-security/optee/optee-client.inc

 SRCREV =3D "a5b1ffcd26e328af0bbf18ab448a38ecd558e05c"

+SRC_URI +=3D "file://0001-tee-supplicant-add-udev-rule-and-systemd-service=
-fil.patch"
+
 inherit pkgconfig
 DEPENDS +=3D "util-linux"
 EXTRA_OEMAKE +=3D "PKG_CONFIG=3Dpkg-config"
--
2.34.1


