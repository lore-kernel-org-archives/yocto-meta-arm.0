Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.41])
 by mx.groups.io with SMTP id smtpd.web10.7120.1588928425459267462
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 May 2020 02:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=5WZiuthb;
 spf=pass (domain: arm.com, ip: 40.107.22.41, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8P+XqY1iQbTCR5rnAZerX3quM2BkW390Mq5XU6Peyo=;
 b=5WZiuthbR9BjCBYFaWmPhjGwOsXnlezXxRIOqLoIJTiwkJMBUwimZXCspC7YuCMyxG2O7ocN9w+T8bkAr2rpH099mVF/3JH+LW/WV9FCckG1rbREjiVOGFO0cRG7dW3My7Whsqqm4AUkm0LEZbzbJQzrrZEvOElGydsNfpOUp1Y=
Received: from AM5P194CA0009.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::19)
 by DB7PR08MB3787.eurprd08.prod.outlook.com (2603:10a6:10:33::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26; Fri, 8 May
 2020 09:00:21 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::83) by AM5P194CA0009.outlook.office365.com
 (2603:10a6:203:8f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend
 Transport; Fri, 8 May 2020 09:00:20 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Fri, 8 May 2020 09:00:20 +0000
Received: ("Tessian outbound ff098c684b24:v54"); Fri, 08 May 2020 09:00:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b21b8c8a8f0c1b93
X-CR-MTA-TID: 64aa7808
Received: from 2a51737e0420.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 22614479-8F44-4DC1-8AC7-AF2955ACB7B8.1;
	Fri, 08 May 2020 09:00:14 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2a51737e0420.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 08 May 2020 09:00:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSPtz3tHtdHu39U7nkYtRFAu+RlTmRI43OdLhvStOkx71XjZAiTIoUlw4YOXPNpUPoBLA17ju8whLM0Jn469kAHnozkWlG550h7DzfTxp+EpdTAy6lrs7xOEtQP5MHVcqNN1ZsYBSHqxd8Kq3MPVKfB1l3EDqylqczvIszazeT36mmlRX3xU5V0U+GmhEqr/tPJuF9hX7FcoduzwoMh5fHBaTX3nKMtsnOzHNIEo3KxUIiaGWOX6tU6klu48Oe5NKs6vEYE0NYs4DeRArnAPfNb7aljT5zlq7Llhoka3qD2XL6Jw4cV+nGklMSQ4VOaYjQ0jGpaIfF+vfvHRP4oT8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8P+XqY1iQbTCR5rnAZerX3quM2BkW390Mq5XU6Peyo=;
 b=XGuP13FlyQSlXs9ePYY8Qgf4cDIPlGhOFiJFD92OuVK7S+vzWnd0blsMEkk7DwKsF8q4a/0ezWHTM0Cr17UcdXu0j63+hhYDCV5wT1rbshQPdhfMXZW+VImydt8/z4BjbhZRS/uGHTqa6nvYrPFb5uPmN4q8ixNQPljWILzQu+L5ZbKeHUw+80OAmyOAYiqRYSY5915dd0rzRL0sb6Sn456bj+e2maCbsVDzCSwUmbNnbrGJL4gKN2GXgOwAdnetFo/+oraokkt3yPFx+f4PrPGvD73q2zvDeslwUhUVPnusvPsmm3g71nhGQtcjdVY5EuqMomuUeZOjvmVIoXA4dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8P+XqY1iQbTCR5rnAZerX3quM2BkW390Mq5XU6Peyo=;
 b=5WZiuthbR9BjCBYFaWmPhjGwOsXnlezXxRIOqLoIJTiwkJMBUwimZXCspC7YuCMyxG2O7ocN9w+T8bkAr2rpH099mVF/3JH+LW/WV9FCckG1rbREjiVOGFO0cRG7dW3My7Whsqqm4AUkm0LEZbzbJQzrrZEvOElGydsNfpOUp1Y=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB4617.eurprd08.prod.outlook.com (2603:10a6:10:75::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Fri, 8 May
 2020 09:00:11 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Fri, 8 May 2020
 09:00:11 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] [arm-autonomy] firmware-image-juno: Add xen-devicetree dependency
Thread-Topic: [meta-arm] [PATCH] [arm-autonomy] firmware-image-juno: Add
 xen-devicetree dependency
Thread-Index: AQHWJFr5zqoExF8ee02BmRosMrDHoqid5XKA
Date: Fri, 8 May 2020 09:00:11 +0000
Message-ID: <BA3F2754-8474-4657-89AF-084FD3C1F248@arm.com>
References: <160CB87CF829AD41.1278@lists.yoctoproject.org>
In-Reply-To: <160CB87CF829AD41.1278@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 445fd4fd-b3f2-42b1-64ca-08d7f32e3c65
x-ms-traffictypediagnostic: DB7PR08MB4617:|DB7PR08MB3787:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3787E03D5E5875E5BB47B3D79DA20@DB7PR08MB3787.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
x-forefront-prvs: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 vm4lwO4Wbvy9fzS+m095VBOMdb1/4OSMnHKpIa2/3qIgb97KZF7S3ap99Um7rqiuG/kQXXaOZGx4ZLjej9SI/loua1tTj4pOWIBZ5OQkKS3rBIzbFUJZT9t12PKuZegQBdGbLHZ2FrnOTRuuZxqc64G21QSzjhkI42Qb7OXhW65CgGBLr3KhrUCc+gsBKZaZ/t2VGo3ffxPXw26hnv0h15TyXCK/kv2U6/yGmvCNKMT7bFW4EHiy3STHIFPVVa7rgFEAZCzTydD7knvqRG20vzbVo1JBpppe7nPf1a0UULuDqIKgBjeekqZ0tJQ2WsiJIYYoiZaTu96JEzzwUomxO529pU3lFsao2TxzVlMNdY11Kez4/rw3IAH+Wc9/3vVTMmIsS+AGnXqvL/+d13lnVw9MYqS8ZlYhoTw2wRLMV2i3mid57J+OqEVv6oZhFi9BhjrQchxiHOl8eeZ7uVZzV6V/crytkYa3fU3x+y3borYZn6H7mFIiQAxo0kapb1m/93SATitSYl68feAOXKBAbWbQ2WdjEOK/tzsO6S6FTAVnqP7HhbclywEcalhDROOx6AxrV8lLJbQSR4Vb4Cv7ZkykA53e2M5f4uArO8bE7y8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(33430700001)(91956017)(186003)(26005)(6506007)(53546011)(2616005)(2906002)(71200400001)(36756003)(83300400001)(316002)(6512007)(83310400001)(83320400001)(83290400001)(83280400001)(6486002)(966005)(33440700001)(8936002)(5660300002)(66446008)(6916009)(66946007)(86362001)(478600001)(4326008)(33656002)(66476007)(8676002)(64756008)(66556008)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 s8MFZv32lsgAalNDMalYmk/TM3ranGDx3wGndNfZo1O71HZqeHLVo28Vlk7KioVYFHz1IqZO+KQzvD8mnAf5861Ncj6tbICkyiyrvt6QFiEtnVw1UbdcQopAwn3JOucGLriDSSM5+4/ya1+KaqVJQPN7qEuZa+HU3NWmjqPgfXjat8s2elkTuZhhecY2XNK/ApNvz2wrxD/smU9gPt18t6JAhw6z/B5Yti0xPu7WaCuk2xxSR4CXi89Bw9ty/hmnsDmZsCGJspWHWZ8/G4f9jjCELqbe3GH2CZI2fwMZkfBE/ZI1WSYOiVrSG0mBIYDE/lUj/IK59UPizxeJCb228vj75jbYQuyszqc+ox3NJk2AKk9YyEyrPVWc/qH1o90rsZYS70isyBUDWPqc7q+VxrchDIV5m3tIiu9DklagQtzcHiKlVSa7lvAdS/YjAFY82elGG2jp/+0ZFediQjBK8nObRGOUgrrUkW6jKwZMXJeRKJsdRmjd1Lm9hfPsSQMu
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4617
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(46966005)(33430700001)(82310400002)(2616005)(36906005)(966005)(47076004)(82740400003)(33656002)(36756003)(33440700001)(70206006)(8676002)(478600001)(2906002)(5660300002)(6486002)(356005)(81166007)(336012)(6512007)(26005)(186003)(6506007)(86362001)(70586007)(6916009)(4326008)(316002)(8936002)(53546011);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e9e03c2e-ec0f-46a2-0088-08d7f32e3759
X-Forefront-PRVS: 039735BC4E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cO4QXpE0FA72BqaX35CbrAmc+PuBSQvD4/Ir0r3t4LQGle7vhdjiuMlUgysDcITIjCvBVF96mS6UIzorMbHMZsEwp4ds5je1m146Y9E4IPZsWgn3w5R40UcPiREpWQIuoHuU2Okr7dIeKym7q3w30zk32Y66w4xf6RkygmCt5bgVP3RklEf5mlcPSa9nfnBlMi5/i+9U89NbTjJep5lw6580HhyF2ALjzKRRfVj9aqaxIJjpqjvr/qW31m9I4SGdDMQqPEbwtmobc8TExBxVqUfw1S/SnjLbFGReyVDxQIhTIZ4jFMCF+wHT8QE/h4QjBD8wbIpM915tWpA/0pMtBF+8dwW0KLFi4urnq9GEaQNnE7Q5DxJrlQGPb2BqumpwnNsqUnEJzFFsN3utOHKijajQlfymkGdKN5izO2EZHkVIxZ+/uTWkcZctXpC6t+j3BPDtl7LAnw8eEZ1onHoLYcxwNqbi6+rSst4O28V7aWxZrPvjUGhmvmGqSTl1HL/O2my4HZ5ueTa2DETR6IuDM45OFDyeV152FqGyhFfDIgPsAq6bRhKTYrU1fxTnUCFEocOAMfRDe2B54FWrF2wIQCaz8ewtzJG3wbwe1r6PGz+wy4aoHt39v5mgqdB/KI0MVLo4SCtw0dHAv9xEHghjuA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 09:00:20.2987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 445fd4fd-b3f2-42b1-64ca-08d7f32e3c65
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3787
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A05B078EE4918F43886FAEA7BAA90E95@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 7 May 2020, at 11:30, Bertrand Marquis via lists.yoctoproject.org <be=
rtrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> From: Diego Sueiro <diego.sueiro@arm.com>
>=20
> The do_deploy task depends on xen-devicetree:do_deploy in order to
> include the generated xen dtbs in the firmware image.
> To avoid dependency loop between firmware-image-juno:do_install,
> xen:do_deploy and xen-devicetree:do_deploy when
> INITRAMFS_IMAGE_BUNDLE =3D "1", we need to handle the xen and
> xen-devicetree binaries copying in the do_deploy task.
>=20
> Also Use OVERRIDES to minimize the usage of
> "@bb.utils.contains('DISTRO_FEATURES', 'xen', ..."
>=20
> Change-Id: I8da476435de73445fb6d895ec418d85861b8c46c
> Issue-Id: SCM-990
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> .../images/firmware-image-juno.bbappend       | 27 ++++++++++++-------
> 1 file changed, 17 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/i=
mages/firmware-image-juno.bbappend b/meta-arm-autonomy/dynamic-layers/meta-=
arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
> index 2904e0b..b0aae69 100644
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/f=
irmware-image-juno.bbappend
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/f=
irmware-image-juno.bbappend
> @@ -1,14 +1,21 @@
> -FILESEXTRAPATHS_prepend :=3D "${@bb.utils.contains('DISTRO_FEATURES', '=
xen', '${THISDIR}/${PN}:', '', d)}"
> +# Use OVERRIDES to minimize the usage of
> +# ${@bb.utils.contains('DISTRO_FEATURES', 'xen', ...
> +OVERRIDES_append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ':=
xen', '', d)}"
>=20
> -INSTALL_EXTRA_DEPS =3D "${@bb.utils.contains('DISTRO_FEATURES', 'xen', =
'xen:do_deploy', '', d)}"
> +FILESEXTRAPATHS_prepend_xen :=3D "${THISDIR}/${PN}:"
>=20
> -do_install[depends] +=3D "${INSTALL_EXTRA_DEPS}"
> +DEPLOY_EXTRA_DEPS ??=3D ""
> +DEPLOY_EXTRA_DEPS_xen =3D "xen:do_deploy xen-devicetree:do_deploy"
>=20
> -do_install_append() {
> -    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'yes', 'no', d=
)}" =3D "yes" ]; then
> -        cp  ${DEPLOY_DIR_IMAGE}/xen-${COMPATIBLE_MACHINE}.efi \
> -            ${D}/${UNPACK_DIR}/SOFTWARE/xen
> -        cp ${DEPLOY_DIR_IMAGE}/*xen.dtb \
> -            ${D}/${UNPACK_DIR}/SOFTWARE/
> -    fi
> +do_deploy[depends] +=3D "${DEPLOY_EXTRA_DEPS}"
> +
> +do_deploy_prepend_xen() {
> +    # To avoid dependency loop between firmware-image-juno:do_install,
> +    # xen:do_deploy and xen-devicetree:do_deploy when
> +    # INITRAMFS_IMAGE_BUNDLE =3D "1", we need to handle the xen and
> +    # xen-devicetree binaries copying in the do_deploy task.
> +    cp  ${DEPLOY_DIR_IMAGE}/xen-${COMPATIBLE_MACHINE}.efi \
> +        ${D}/${UNPACK_DIR}/SOFTWARE/xen
> +    cp ${DEPLOY_DIR_IMAGE}/*xen.dtb \
> +        ${D}/${UNPACK_DIR}/SOFTWARE/
> }
> --=20
> 2.17.1
>=20
>=20

