Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1317AC47079
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 12:46:15 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.73])
 by mx.groups.io with SMTP id smtpd.web10.5771.1704717973753688095
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jan 2024 04:46:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=rKDKjcRh;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=rKDKjcRh;
 spf=pass (domain: arm.com, ip: 40.107.8.73, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=e5s4nGUlgMO/AN3bMBXEE1l9M5YOG5EDNiMlLm0Dovz6Jtz/zwDBBRowaxPGO2eVFaksxbsuZhBPo3+T0J97E2t3/86jp2OyEaG8+sKtGElU50Wy5rmcgR1uVSNzNmOtTi3snjDdqYRSaAE+Guk0ehtvMrVr1D8X1DEr7ZiC2TYPVA8nants12malkyfMQit20K2tTkFZayj/rieCJADvV6kyPxI55pInNrsJ520xYXpQ/c8q+QS2RHZAA/7mfev4w3JIpeGrUKzv05zZpmcjTRxtJ55gcFH3t4Z+L/+7cxpzWXr1rJn/muSLJZlU+pCyxSFYsKg9Ia7i9+NpOv+pw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MH+CFu0d/eS9ZAChC0pQgwNaixaK/8bq8gcikGDdRgQ=;
 b=OgYl/qFGybxJjjpIC8lICv2pOpgPANfJrQWJ5ZKYDDvfb9XDgv6YsmYNYcQsizTmtIyFzJ6N7d08MV06n5PdvRVYbpcCK8mRkDxNOAYpe4A9QMhjqwxxleDItgwdXKXbwqSGY+ZkBXcQXtcyMJ5w0n3p0SuLuEchVSKvwZtXYm+GzOE5OE0TVWpoAHttcVO/hcRxjHrrqdiXaTkXmIzAZOYM+XbZoSnzkGwXMeqNByJe/cMokKpUsTv5dYSVYNuMoQOneO7rll0aKqVySiAClyHCuAgOmjrJbXbNDhxcSgXX2dQtLYZGoWi+DyBD26NDNNSxFjPzgc/kzmxaI2vcXQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MH+CFu0d/eS9ZAChC0pQgwNaixaK/8bq8gcikGDdRgQ=;
 b=rKDKjcRhHP4O/remQxB3rarigAQUQ+4/zVoyMvX4NRikHzzx2TJ+EP/li1UVRUNDzVriJZEn8tK+qSf4CGCjfrXhql2fFxZrNjZbm0MKXBIGSmCKaaGfr+DGgxxyrKc6CxdGemlMObfZmRebE5gU09NoMu6cXv3Y7G2FaKdKpDM=
Received: from AS9PR06CA0343.eurprd06.prod.outlook.com (2603:10a6:20b:466::26)
 by VI1PR08MB5470.eurprd08.prod.outlook.com (2603:10a6:803:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 12:46:09 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:20b:466:cafe::6f) by AS9PR06CA0343.outlook.office365.com
 (2603:10a6:20b:466::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21 via Frontend
 Transport; Mon, 8 Jan 2024 12:46:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.12 via Frontend Transport; Mon, 8 Jan 2024 12:46:08 +0000
Received: ("Tessian outbound 53c3c09c1e1b:v239"); Mon, 08 Jan 2024 12:46:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c635b6062cf32a30
X-CR-MTA-TID: 64aa7808
Received: from 8ba406c08b65.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 977EAF00-3815-44A4-B3D6-5A03B31363F6.1;
	Mon, 08 Jan 2024 12:46:02 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8ba406c08b65.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 08 Jan 2024 12:46:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOAMcvfO9k3vBUy+t3Skw5XrTgWWsqd4ymPFn+hwfZ2LAb7GwDdF2GRltTJVBR7AnSNQi3emWmLLhPmo8PFOYgO8yKa+VbmePeAeRiIXhCrrc7/PKVX35jO9gdP2trHDGmEZ7mQB0sSZoiN7tGWxEnYgwx8VwAnm15z9TOWGIekCPSuUNA84yWZlLun04fxrs3hBJX2uIe3Fgf/SNeAdjaPDrKXpckX5JRBBmLMTsn39uwfremHb8gsixDLPuRuakm0BR3Ox9mpwQ4uP6CBzhXiRpA3EuUabzowFF8/VHmYOYFELdIUfpZ9qLbwFJPdBo+pDNzOh6KFvVrJxlZ/BCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MH+CFu0d/eS9ZAChC0pQgwNaixaK/8bq8gcikGDdRgQ=;
 b=kpPPUN30FUIzU1KXIS9k0p3kMb4YGfo+xRBHBxPOkZiGXePmvnMKvTsai/wu6/TpxekiVgcgFQsGDd8nVbxugPueE9zDZUonzUgopQNJ/eQlTc7WlPkUnKnhv0wS3IBi4f9WbV/HymzsEfuBJYdbaMBJrCS2puwbfwFVo/IDkcOx5l1JeXorYy9ERZkUXppWiEyRwNYmLKHEBqnldUdS1FZKXqTh/Jg49nzFmxylMA1oZ/FSbS3xHM0Io3D8d5KSReiwCc7EYlTi3xGoCaEZSUu0WuyUSWwgsflmmEJ0AN/YZCH5mgXiSt0eBmfR3mG1Gr6+hj8MPwy1SiX449NHiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MH+CFu0d/eS9ZAChC0pQgwNaixaK/8bq8gcikGDdRgQ=;
 b=rKDKjcRhHP4O/remQxB3rarigAQUQ+4/zVoyMvX4NRikHzzx2TJ+EP/li1UVRUNDzVriJZEn8tK+qSf4CGCjfrXhql2fFxZrNjZbm0MKXBIGSmCKaaGfr+DGgxxyrKc6CxdGemlMObfZmRebE5gU09NoMu6cXv3Y7G2FaKdKpDM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM7PR08MB5303.eurprd08.prod.outlook.com (2603:10a6:20b:102::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 12:46:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 12:46:00 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Jon Mason <Jon.Mason@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 1/2] arm-systemready: Add parted dependency and
 inherit testimage
Thread-Topic: [meta-arm] [PATCH 1/2] arm-systemready: Add parted dependency
 and inherit testimage
Thread-Index: AQHaQfYd99oq6AAAD0qYZatAwAxGirDP3UqA
Date: Mon, 8 Jan 2024 12:46:00 +0000
Message-ID: <8ABB267E-DE52-4404-B53C-3BA4132AFB7E@arm.com>
References: <20240108054633.1425680-1-Debbie.Martin@arm.com>
In-Reply-To: <20240108054633.1425680-1-Debbie.Martin@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM7PR08MB5303:EE_|AM2PEPF0001C711:EE_|VI1PR08MB5470:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a54211-1866-4958-da69-08dc1047c949
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mhhUkfcjNuVTAY+mE2H/Nn1nElq/rKWoF8EfPVseRNyca9HCe1GsmNlgbQ2nhGnZBTY8huXMKAY+6Adph5VW+7w/dFvCTsday0LSkioVIj9jtOMkb3pojTrKdVAt/aUpOAfFTXc2M3FmFWPgkr4mEuGvjceJKkQhqFq7UVnQfMNhPxGKVUwQirzjayvxFjhP2l0p3vtyLGDYuHjgeH8xUpXEriNudWVuzqCdCcSGwN8dc6IrMWpm4DEtEGbLbxccBv2Kq7RedMjQrpKa9mRE8MkahsBcgVbIXq4r58n/C6Zn/QdRdG1I2/ipOu02HHlPPIIS4yl04tWyoxiopUI2Vc8uqsA3OT5UA9ItLJWRIWI1CbqTI3g1kQ1/AKOrYrxP1JbedTr1CudvWhRMSU5ZKIF0g82rASG0Q+/LVV1HWoYyoN/Bb/tvAYA0TCJYGRsDdUsi851R2XSYX8GN907zjgT5Apk8A+EOqli+aL1JhjJS2tYAzM37XCnytSabJ1kvKN9i3QOHMKhj/q7gm99beS+NkSS0XHw65uoCjL+q7YqoXdm5P+fKW0cwy5vLQHRaNv5n76tcqEwOmbQWctPpdQPMuUgrKhcgbqc2avoQmwz3VqlZmxowNtCy0sFPptck
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39850400004)(346002)(366004)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66899024)(122000001)(38100700002)(4326008)(6862004)(5660300002)(2906002)(38070700009)(478600001)(6512007)(71200400001)(6506007)(53546011)(966005)(33656002)(83380400001)(2616005)(26005)(37006003)(91956017)(316002)(6636002)(76116006)(66476007)(66446008)(64756008)(36756003)(66946007)(66556008)(8936002)(8676002)(6486002)(86362001)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D6291371FCD8954EB2410EAFD629EF82@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5303
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	23593f51-3d84-4642-c961-08dc1047c43a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5u5thS1bDXrE9asnbj57VHLGG+rQdv/K5Am0fC6L5b9T3JaHdA4lMIcZhqkjc1+CzIGSimizWkPKOIXSB3s+HSV75JIQUC5dWUyuZAHiPODJRKtS2NoE8JkHc/0NBdpUVtOiPdYY+OH1MkgYOozH/9rJayHCduNcjjF8oMMGpcx8qleUdn2IZpcBV97tekOv6yg+DFGhNmOVZ/6uxg8HFOutUVOEl+oKWLsDDRZ9Q80qq5I5koW3wdLsOlg+egUzeoz5RKzoEAG/NFRI24MtnrwFItBeJIiElE/F0AQwyWD3/i7gawbX46ZExE+U2ruxL/DUlCLdaIPpdTxmd/UjyR9iupTg/IFVw+tFF7BqAPHWoq2wFmc9wJ6m+VqnMoLxRO5ayVjnq4okFBp+UYDrfc1FInIxfupRFYR6eyNAH5V+h9PW7l2P7TlxrJ+BGjyrT0wNNvlK/RJq75gchri0B4XgJCNf3wZzDAnRKlYWcbcxZzghknEW5sdGaSme8jhmh12CyZuH8Gg/7NLCUiMPcWSgqkRAAEiyA3LVtpwuzcGA69+DdDmoEPJgplHhRYnQwPKbtXPilIT8eh6175OdBnTmwxxhh+zTZjknBcoB+DpP3qLj1jlB2xOE6U5vJYBSF1/ZUGb7romU0Wgc+JmkHsaAwSD8QVdSJ4UJcFU+qj8vL3tUuysnXuY79qm4RQa1
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39850400004)(376002)(396003)(136003)(230922051799003)(82310400011)(186009)(451199024)(64100799003)(1800799012)(36840700001)(46966006)(36860700001)(316002)(37006003)(336012)(8936002)(47076005)(8676002)(36756003)(6506007)(83380400001)(6862004)(4326008)(33656002)(53546011)(40480700001)(70586007)(70206006)(2616005)(6512007)(6486002)(478600001)(966005)(6636002)(26005)(2906002)(82740400003)(5660300002)(66899024)(41300700001)(81166007)(86362001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 12:46:08.5081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a54211-1866-4958-da69-08dc1047c949
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5470
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Jan 2024 12:46:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5320

These are for Nanbield branch.

> On 8 Jan 2024, at 05:46, Debbie Martin via lists.yoctoproject.org <debbie=
.martin=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> Add the parted-native dependency explicitly which is needed to
> use wic commands.
>=20
> Also explicitly inherit testimage. This means that the kas config
> is no longer required to include it in IMAGE_CLASSES.
>=20
> Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
> ---
> kas/arm-systemready-ir-acs.yml                           | 5 -----
> meta-arm-systemready/classes/arm-systemready-acs.bbclass | 7 ++++---
> 2 files changed, 4 insertions(+), 8 deletions(-)
>=20
> diff --git a/kas/arm-systemready-ir-acs.yml b/kas/arm-systemready-ir-acs.=
yml
> index 38604d7f..aef3e712 100644
> --- a/kas/arm-systemready-ir-acs.yml
> +++ b/kas/arm-systemready-ir-acs.yml
> @@ -8,10 +8,5 @@ env:
>   # The full testimage run typically takes around 12-24h on fvp-base.
>   TEST_OVERALL_TIMEOUT: "${@ 24*60*60}"
>=20
> -local_conf_header:
> -  systemready-ir-acs: |
> -    IMAGE_CLASSES:append =3D " testimage"
> -
> -
> target:
>   - arm-systemready-ir-acs
> diff --git a/meta-arm-systemready/classes/arm-systemready-acs.bbclass b/m=
eta-arm-systemready/classes/arm-systemready-acs.bbclass
> index e9888023..28e800c8 100644
> --- a/meta-arm-systemready/classes/arm-systemready-acs.bbclass
> +++ b/meta-arm-systemready/classes/arm-systemready-acs.bbclass
> @@ -12,12 +12,11 @@
> INHIBIT_DEFAULT_DEPS =3D "1"
> COMPATIBLE_HOST =3D "aarch64-*"
> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> -inherit nopackages deploy rootfs-postcommands ${IMAGE_CLASSES} python3na=
tive
> +inherit nopackages deploy rootfs-postcommands ${IMAGE_CLASSES} python3na=
tive testimage
>=20
> do_configure[noexec] =3D "1"
> do_compile[noexec] =3D "1"
> do_install[noexec] =3D "1"
> -do_testimage[depends] +=3D "mtools-native:do_populate_sysroot"
>=20
> # Deploy with this suffix so it is picked up in the machine configuration
> IMAGE_DEPLOY_SUFFIX ?=3D ".wic"
> @@ -80,7 +79,9 @@ RM_WORK_EXCLUDE_ITEMS +=3D "${@ os.path.basename(d.getV=
ar('TEST_LOG_DIR')) }"
>=20
> do_testimage[postfuncs] +=3D "acs_logs_handle"
> do_testimage[depends] +=3D "edk2-test-parser-native:do_populate_sysroot \
> -                          arm-systemready-scripts-native:do_populate_sys=
root"
> +                          arm-systemready-scripts-native:do_populate_sys=
root \
> +                          mtools-native:do_populate_sysroot \
> +                          parted-native:do_populate_sysroot"
>=20
> # Process the logs
> python acs_logs_handle() {
> --=20
> 2.25.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5318): https://lists.yoctoproject.org/g/meta-arm/mess=
age/5318
> Mute This Topic: https://lists.yoctoproject.org/mt/103592511/6875888
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross.burton=
@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


