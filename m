Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.62])
 by mx.groups.io with SMTP id smtpd.web10.2570.1592466570907191962
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2020 00:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=lvaQ/JRM;
 spf=pass (domain: arm.com, ip: 40.107.21.62, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8wa8kt8mcU0EzpYieKzy9/m5u17tyZRK4NvcOalTfs=;
 b=lvaQ/JRM3jTFr04vg1CU9EXSlfU/BBh12nBILa3pCr/uyUrUOoJRkNAjYoTTvCWPYjTrEgbYs+1Kgk6jnsNjjYm2fu23goUVrUZDpyFjlue2eiKIQriVpjt0QPzfnOkwOt19GTwhbrvRhsFYR2z0qqgm5X0ef3dYN9hnss1Dtbg=
Received: from DB7PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:10:36::31)
 by DB8PR08MB5274.eurprd08.prod.outlook.com (2603:10a6:10:e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19; Thu, 18 Jun
 2020 07:49:27 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::8b) by DB7PR05CA0018.outlook.office365.com
 (2603:10a6:10:36::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Thu, 18 Jun 2020 07:49:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Thu, 18 Jun 2020 07:49:27 +0000
Received: ("Tessian outbound 13f833fb3c6d:v59"); Thu, 18 Jun 2020 07:49:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6e609202da20f5db
X-CR-MTA-TID: 64aa7808
Received: from 1db368de2bb9.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 129DC327-4B1E-411D-A657-7D2438404D80.1;
	Thu, 18 Jun 2020 07:49:21 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1db368de2bb9.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 18 Jun 2020 07:49:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwJ+kw0MBbXehDYTBuzQ3oaymV1SAgg/1xJoHysdA+MIIH1T/Bwb7dhE3LlQao0wVHeTYc51t2rV/nyYFMcyxZIBm8QsVszNAAXfcXgKU9JtBn1xPzGpBDNfHilO6BiJZGrsLkG3o5FfPom3hI+RmEey1WSQRqTx5N+qf/T1p4FruOnPHP5k/672yGUDgzOsjCnLmTt4JCX3sQSygeMz3sze+0bfmAiEfvJuXhcFa2cruN02W96lOicBruPJRIovEbM7A7+rt2TYQei8vIPlL2W3HE106IpH2cIRUwbyKFBmYdcYfCxt/IR6707z4MyYUY9a9hQMwUs2cIPeF0XUQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8wa8kt8mcU0EzpYieKzy9/m5u17tyZRK4NvcOalTfs=;
 b=LkEn1Wyq2UvD9IyQPjCTPXlJ1XbC/Kd7nQNbTZIPYTWH4rsQZdAW3KPo0ltb/S3YKqtAvOdEOrqjtnZDIx18IJW17528NWXrofbWhPvDo/sliN1GDzPBo8tlLUxqxewhtsqM6DfXIUMamVwpNMpvh7Xpz4BoFXGDFzAFpQuxq6FQFmS9b0UZKqyzSlXa+1dXdPUhDp5joAhKv5XxQDRYUT2P+YSKfSXHigDZqigKWe4knjNXn0evSLYABVO0mTVhXDFR1lLhIpHKphVDRU6OuS2FpqiRNiHtUmgX+DEUGQa/JtNnW1EQS0yZpexWeRA60LUDTDhpf5Iswb805CTGLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8wa8kt8mcU0EzpYieKzy9/m5u17tyZRK4NvcOalTfs=;
 b=lvaQ/JRM3jTFr04vg1CU9EXSlfU/BBh12nBILa3pCr/uyUrUOoJRkNAjYoTTvCWPYjTrEgbYs+1Kgk6jnsNjjYm2fu23goUVrUZDpyFjlue2eiKIQriVpjt0QPzfnOkwOt19GTwhbrvRhsFYR2z0qqgm5X0ef3dYN9hnss1Dtbg=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB4617.eurprd08.prod.outlook.com (2603:10a6:10:75::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.23; Thu, 18 Jun
 2020 07:49:20 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 07:49:19 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Jon Mason <jdmason@kudzu.us>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp: Move to linux-linaro-arm for fvp-base and foundation-armv8
Thread-Topic: [meta-arm] [PATCH] arm-bsp: Move to linux-linaro-arm for
 fvp-base and foundation-armv8
Thread-Index: AQHWQ7UmeWKB/tMKj0ijwpM2HKufJKja42wAgAHWvwCAAUhcgA==
Date: Thu, 18 Jun 2020 07:49:19 +0000
Message-ID: <90654ED3-3B67-4FA8-BE55-D1944DF4E4D1@arm.com>
References: <20200616080616.5509-1-luca.fancellu@arm.com>
 <EF47F71E-759D-41EA-99C1-058554205849@arm.com>
 <20200617121403.GA21297@kudzu.us>
In-Reply-To: <20200617121403.GA21297@kudzu.us>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8f8bf44f-5da5-4582-18a5-08d8135c2080
x-ms-traffictypediagnostic: DB7PR08MB4617:|DB8PR08MB5274:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB5274C2042AF2C04F98EA04909D9B0@DB8PR08MB5274.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5516;OLM:5516;
x-forefront-prvs: 0438F90F17
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 d4QuYmSEa6Fw3DFO+H0SMUjVYCle4ZepKjLA+GXuhaQQHE2WKBHO/428o5gJdHCeYkzpcwVuwo8oFG8DLoe5Kg4dUnsMaqS+LixgFGEN/U2FGYLT42x0CmP7FUCRZyHrm9ZHTpMBXjs3KrHjKfe4zq1B+rxgmLUrRv30egRJQx0N95O8YMDU3wd45dWE+SwwiLF6PgUTwAml5rcd79VPUytoKTbcah41t5rho651phQ+OI50FEUVyTCc2tAs9h3XZPsVxgwkkzx12Aq8vaNkKH+F+03UQawVzllbyXCvuaajyA2gJrLr2Wqqwt7oROydeUlfXzXJ7PqmfGTA1qxyHo2WQhBb7koGFcGqsMobM4z3+9HYJ+0fjm+sLXB1aSDvAm5HHVeSSziqCZ0Jp0K2vQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(66446008)(966005)(83380400001)(6916009)(66476007)(86362001)(2906002)(4326008)(186003)(6512007)(53546011)(64756008)(6506007)(66556008)(2616005)(5660300002)(478600001)(30864003)(36756003)(8936002)(71200400001)(33656002)(8676002)(26005)(91956017)(66946007)(6486002)(54906003)(76116006)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 +KnaGNMwGqovLvGRxv03BheZnGU1le/WK1fQ5dx697gVH0LJQ7S4sj53syFYC+82crf5H+LLJzxOANGZZ5pAfHheGApPZwqWdkgMcYMl/uCJPvq8+z16LqPOOZfFHK8aNqqTtsuIwykjTpFie9ixilldH+Ivojf/8P97Va82KuIS/yilKzgfmQRZ03oP9yTrH/OC99tNL2m8ijEnJmqEi1/8Zuj+VQLv9GqWWqYnhBDiewDaz51ggQ36QS48fqZdjKmtGIqoTiQZn7cxv6limelSA0nKhI3dn7e2da6mDMh6jBIMgly9P5OYgmDLsiER4KkKiZiF4wUX2qiNVyxABS2j/s9vGxRSyR77fcIbq7roXqXAIAv84Zmry54tOLGwnL8vA9a3c76Fwzx7JRoVghDO4D8LsmH4zxRcyi792OGYqI1Efb0Gs5kUYHRzOYKhffs+GxHyykqbJHA+CassRb7vnRiflB00xbmah1YE8Uc=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4617
Original-Authentication-Results: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(46966005)(70206006)(70586007)(8676002)(36756003)(2906002)(8936002)(6862004)(478600001)(966005)(4326008)(83380400001)(82740400003)(82310400002)(6486002)(336012)(86362001)(6512007)(47076004)(356005)(2616005)(30864003)(5660300002)(33656002)(26005)(53546011)(6506007)(316002)(54906003)(81166007)(186003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f2eae052-2a96-4e16-79a5-08d8135c1be1
X-Forefront-PRVS: 0438F90F17
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l6DhQMZIoop7psqKzdvd/0CUiysQi5MEY+3aHWZJ44vHUxknR4B55TrYinoi119sfA3vLRkDYG2Cfu2y1bCnCAs1PNbi5W/pbay3Co/GuVsIu8JshvjlxtFbq8WZhPCC5o5mqCvcUXbv19SXnDdj4Odw/ivyCJzC3X8SdQfVAAOIvyd7OIGnEMkheLCsCZ+45D/KZ4dyY/yF2XbGBX3PVRPmN9yFGL3rdm/cijbKwCAneVlpQCSFyndjBxUXclpXd4s4bGpfjQdhtQhehpUgmYIPgtxlpIa8/+08Zvaw+x4VPzB8l/Cdb3UmqNBXW667v3Y4l4ZY+QM4P2/EUk6sUWYmYgYYny8+Elp79rmFpr7hleFf7GC7B+dv7UlMVvjYwoXXBotojzsys9v5bLvpS5boEDs2l9vNOSI2CMm2KZ6ReoXDLwWxvKn8s4Cm8Y0Kl76ZntZCgfFkp1yZvvrXrS5NgZGvcst1WkF228RM9yk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2020 07:49:27.6030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8bf44f-5da5-4582-18a5-08d8135c2080
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5274
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <04BB149384566E469A47512CD40449F8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 17 Jun 2020, at 13:14, Jon Mason <jdmason@kudzu.us> wrote:
>=20
> On Tue, Jun 16, 2020 at 08:09:13AM +0000, Bertrand Marquis wrote:
>>=20
>>=20
>>> On 16 Jun 2020, at 09:06, luca fancellu via lists.yoctoproject.org <lu=
ca.fancellu=3Darm.com@lists.yoctoproject.org> wrote:
>>>=20
>>> Change fvp-base and foundation-armv8 kernel from linux-yocto_5.4
>>> to linux-linaro-arm_4.19 because some drivers are not available.
>>> Furthermore, for fvp-base the linaro kernel comes with the dts
>>> file removing the needs to support it on our side.
>>>=20
>>> Change-Id: I844d92f173406542c2bad8d89793513f8bc28fd1
>>> Signed-off-by: luca fancellu <luca.fancellu@arm.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Applied to the master branch.

Can this also be applied in Dunfell ?

Thanks
Bertrand

>=20
> Thanks,
> Jon
>=20
>>=20
>>> ---
>>> meta-arm-bsp/conf/machine/fvp-base.conf       |   2 +-
>>> meta-arm-bsp/conf/machine/fvp-common/fvp.inc  |   4 +-
>>> .../fvp-base-gicv3-psci-common-custom.dtsi    | 264 ----------------
>>> .../dts/arm/fvp-base-gicv3-psci-custom.dts    |   9 -
>>> .../dts/arm/rtsm_ve-motherboard-nomap.dtsi    | 282 ------------------
>>> .../linux/linux-yocto-arm-platforms.inc       |   6 -
>>> 6 files changed, 3 insertions(+), 564 deletions(-)
>>> delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp=
-base-gicv3-psci-common-custom.dtsi
>>> delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp=
-base-gicv3-psci-custom.dts
>>> delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/arm/rts=
m_ve-motherboard-nomap.dtsi
>>>=20
>>> diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/co=
nf/machine/fvp-base.conf
>>> index 3039644..ae6b28c 100644
>>> --- a/meta-arm-bsp/conf/machine/fvp-base.conf
>>> +++ b/meta-arm-bsp/conf/machine/fvp-base.conf
>>> @@ -6,7 +6,7 @@
>>>=20
>>> require conf/machine/fvp-common/fvp.inc
>>>=20
>>> -KERNEL_DEVICETREE =3D "arm/fvp-base-gicv3-psci-custom.dtb"
>>> +KERNEL_DEVICETREE =3D "arm/fvp-base-aemv8a-aemv8a.dtb"
>>>=20
>>> # Use haveged as a source of entropy instead of rng-tools (Needed for =
ssh).
>>> # rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow b=
oot time.
>>> diff --git a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc b/meta-arm-b=
sp/conf/machine/fvp-common/fvp.inc
>>> index 08f8b15..f8a2584 100644
>>> --- a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
>>> +++ b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
>>> @@ -34,8 +34,8 @@ DISK_IMG_PARTITION3_CONTENT =3D ""
>>>=20
>>> SERIAL_CONSOLES =3D "115200;ttyAMA0"
>>>=20
>>> -PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
>>> -PREFERRED_VERSION_linux-yocto ?=3D "5.4%"
>>> +PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-linaro-arm"
>>> +PREFERRED_VERSION_linux-linaro-arm ?=3D "4.19%"
>>>=20
>>> EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-boot"
>>>=20
>>> diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp-base-=
gicv3-psci-common-custom.dtsi b/meta-arm-bsp/recipes-kernel/linux/files/dts=
/arm/fvp-base-gicv3-psci-common-custom.dtsi
>>> deleted file mode 100644
>>> index 1e056be..0000000
>>> --- a/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp-base-gicv3-p=
sci-common-custom.dtsi
>>> +++ /dev/null
>>> @@ -1,264 +0,0 @@
>>> -/*
>>> - * Copyright (c) 2017-2018, ARM Limited and Contributors. All rights =
reserved.
>>> - *
>>> - * SPDX-License-Identifier: BSD-3-Clause
>>> - */
>>> -
>>> -/memreserve/ 0x80000000 0x00010000;
>>> -
>>> -/include/ "rtsm_ve-motherboard-nomap.dtsi"
>>> -
>>> -/ {
>>> -	model =3D "FVP Base";
>>> -	compatible =3D "arm,vfp-base", "arm,vexpress";
>>> -	interrupt-parent =3D <&gic>;
>>> -	#address-cells =3D <2>;
>>> -	#size-cells =3D <2>;
>>> -
>>> -	aliases {
>>> -	=09serial0 =3D &v2m_serial0;
>>> -	=09serial1 =3D &v2m_serial1;
>>> -	=09serial2 =3D &v2m_serial2;
>>> -	=09serial3 =3D &v2m_serial3;
>>> -	};
>>> -
>>> -	psci {
>>> -	=09compatible =3D "arm,psci-1.0", "arm,psci-0.2", "arm,psci";
>>> -	=09method =3D "smc";
>>> -	=09cpu_suspend =3D <0xc4000001>;
>>> -	=09cpu_off =3D <0x84000002>;
>>> -	=09cpu_on =3D <0xc4000003>;
>>> -	=09sys_poweroff =3D <0x84000008>;
>>> -	=09sys_reset =3D <0x84000009>;
>>> -	};
>>> -
>>> -	cpus {
>>> -	=09#address-cells =3D <2>;
>>> -	=09#size-cells =3D <0>;
>>> -
>>> -	=09cpu-map {
>>> -	=09	cluster0 {
>>> -	=09	=09core0 {
>>> -	=09	=09	cpu =3D <&CPU0>;
>>> -	=09	=09};
>>> -	=09	=09core1 {
>>> -	=09	=09	cpu =3D <&CPU1>;
>>> -	=09	=09};
>>> -	=09	=09core2 {
>>> -	=09	=09	cpu =3D <&CPU2>;
>>> -	=09	=09};
>>> -	=09	=09core3 {
>>> -	=09	=09	cpu =3D <&CPU3>;
>>> -	=09	=09};
>>> -	=09	};
>>> -
>>> -	=09	cluster1 {
>>> -	=09	=09core0 {
>>> -	=09	=09	cpu =3D <&CPU4>;
>>> -	=09	=09};
>>> -	=09	=09core1 {
>>> -	=09	=09	cpu =3D <&CPU5>;
>>> -	=09	=09};
>>> -	=09	=09core2 {
>>> -	=09	=09	cpu =3D <&CPU6>;
>>> -	=09	=09};
>>> -	=09	=09core3 {
>>> -	=09	=09	cpu =3D <&CPU7>;
>>> -	=09	=09};
>>> -	=09	};
>>> -	=09};
>>> -
>>> -	=09idle-states {
>>> -	=09	entry-method =3D "arm,psci";
>>> -
>>> -	=09	CPU_SLEEP_0: cpu-sleep-0 {
>>> -	=09	=09compatible =3D "arm,idle-state";
>>> -	=09	=09local-timer-stop;
>>> -	=09	=09arm,psci-suspend-param =3D <0x0010000>;
>>> -	=09	=09entry-latency-us =3D <40>;
>>> -	=09	=09exit-latency-us =3D <100>;
>>> -	=09	=09min-residency-us =3D <150>;
>>> -	=09	};
>>> -
>>> -	=09	CLUSTER_SLEEP_0: cluster-sleep-0 {
>>> -	=09	=09compatible =3D "arm,idle-state";
>>> -	=09	=09local-timer-stop;
>>> -	=09	=09arm,psci-suspend-param =3D <0x1010000>;
>>> -	=09	=09entry-latency-us =3D <500>;
>>> -	=09	=09exit-latency-us =3D <1000>;
>>> -	=09	=09min-residency-us =3D <2500>;
>>> -	=09	};
>>> -	=09};
>>> -
>>> -	=09CPU0:cpu@0 {
>>> -	=09	device_type =3D "cpu";
>>> -	=09	compatible =3D "arm,armv8";
>>> -	=09	reg =3D <0x0 0x0>;
>>> -	=09	enable-method =3D "psci";
>>> -	=09	cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>>> -	=09	next-level-cache =3D <&L2_0>;
>>> -	=09};
>>> -
>>> -	=09CPU1:cpu@1 {
>>> -	=09	device_type =3D "cpu";
>>> -	=09	compatible =3D "arm,armv8";
>>> -	=09	reg =3D <0x0 0x1>;
>>> -	=09	enable-method =3D "psci";
>>> -	=09	cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>>> -	=09	next-level-cache =3D <&L2_0>;
>>> -	=09};
>>> -
>>> -	=09CPU2:cpu@2 {
>>> -	=09	device_type =3D "cpu";
>>> -	=09	compatible =3D "arm,armv8";
>>> -	=09	reg =3D <0x0 0x2>;
>>> -	=09	enable-method =3D "psci";
>>> -	=09	cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>>> -	=09	next-level-cache =3D <&L2_0>;
>>> -	=09};
>>> -
>>> -	=09CPU3:cpu@3 {
>>> -	=09	device_type =3D "cpu";
>>> -	=09	compatible =3D "arm,armv8";
>>> -	=09	reg =3D <0x0 0x3>;
>>> -	=09	enable-method =3D "psci";
>>> -	=09	cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>>> -	=09	next-level-cache =3D <&L2_0>;
>>> -	=09};
>>> -
>>> -	=09CPU4:cpu@100 {
>>> -	=09	device_type =3D "cpu";
>>> -	=09	compatible =3D "arm,armv8";
>>> -	=09	reg =3D <0x0 0x100>;
>>> -	=09	enable-method =3D "psci";
>>> -	=09	cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>>> -	=09	next-level-cache =3D <&L2_0>;
>>> -	=09};
>>> -
>>> -	=09CPU5:cpu@101 {
>>> -	=09	device_type =3D "cpu";
>>> -	=09	compatible =3D "arm,armv8";
>>> -	=09	reg =3D <0x0 0x101>;
>>> -	=09	enable-method =3D "psci";
>>> -	=09	cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>>> -	=09	next-level-cache =3D <&L2_0>;
>>> -	=09};
>>> -
>>> -	=09CPU6:cpu@102 {
>>> -	=09	device_type =3D "cpu";
>>> -	=09	compatible =3D "arm,armv8";
>>> -	=09	reg =3D <0x0 0x102>;
>>> -	=09	enable-method =3D "psci";
>>> -	=09	cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>>> -	=09	next-level-cache =3D <&L2_0>;
>>> -	=09};
>>> -
>>> -	=09CPU7:cpu@103 {
>>> -	=09	device_type =3D "cpu";
>>> -	=09	compatible =3D "arm,armv8";
>>> -	=09	reg =3D <0x0 0x103>;
>>> -	=09	enable-method =3D "psci";
>>> -	=09	cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>>> -	=09	next-level-cache =3D <&L2_0>;
>>> -	=09};
>>> -
>>> -	=09L2_0: l2-cache0 {
>>> -	=09	compatible =3D "cache";
>>> -	=09};
>>> -	};
>>> -
>>> -	memory@80000000 {
>>> -	=09device_type =3D "memory";
>>> -	=09reg =3D <0x00000000 0x80000000 0 0x7F000000>,
>>> -	=09      <0x00000008 0x80000000 0 0x80000000>;
>>> -	};
>>> -
>>> -	gic: interrupt-controller@2f000000 {
>>> -	=09compatible =3D "arm,gic-v3";
>>> -	=09#interrupt-cells =3D <3>;
>>> -	=09#address-cells =3D <2>;
>>> -	=09#size-cells =3D <2>;
>>> -	=09ranges;
>>> -	=09interrupt-controller;
>>> -	=09reg =3D <0x0 0x2f000000 0 0x10000>,	// GICD
>>> -	=09      <0x0 0x2f100000 0 0x200000>,	// GICR
>>> -	=09      <0x0 0x2c000000 0 0x2000>,	// GICC
>>> -	=09      <0x0 0x2c010000 0 0x2000>,	// GICH
>>> -	=09      <0x0 0x2c02f000 0 0x2000>;	// GICV
>>> -	=09interrupts =3D <1 9 4>;
>>> -
>>> -	=09its: its@2f020000 {
>>> -	=09	compatible =3D "arm,gic-v3-its";
>>> -	=09	msi-controller;
>>> -	=09	reg =3D <0x0 0x2f020000 0x0 0x20000>; // GITS
>>> -	=09};
>>> -	};
>>> -
>>> -	timer {
>>> -	=09compatible =3D "arm,armv8-timer";
>>> -	=09interrupts =3D <1 13 0xff01>,
>>> -	=09	     <1 14 0xff01>,
>>> -	=09	     <1 11 0xff01>,
>>> -	=09	     <1 10 0xff01>;
>>> -	=09clock-frequency =3D <100000000>;
>>> -	};
>>> -
>>> -	timer@2a810000 {
>>> -	=09	compatible =3D "arm,armv7-timer-mem";
>>> -	=09	reg =3D <0x0 0x2a810000 0x0 0x10000>;
>>> -	=09	clock-frequency =3D <100000000>;
>>> -	=09	#address-cells =3D <2>;
>>> -	=09	#size-cells =3D <2>;
>>> -	=09	ranges;
>>> -	=09	frame@2a830000 {
>>> -	=09	=09frame-number =3D <1>;
>>> -	=09	=09interrupts =3D <0 26 4>;
>>> -	=09	=09reg =3D <0x0 0x2a830000 0x0 0x10000>;
>>> -	=09	};
>>> -	};
>>> -
>>> -	pmu {
>>> -	=09compatible =3D "arm,armv8-pmuv3";
>>> -	=09interrupts =3D <0 60 4>,
>>> -	=09	     <0 61 4>,
>>> -	=09	     <0 62 4>,
>>> -	=09	     <0 63 4>;
>>> -	};
>>> -
>>> -	smb@8000000 {
>>> -	=09compatible =3D "simple-bus";
>>> -
>>> -	=09#address-cells =3D <2>;
>>> -	=09#size-cells =3D <1>;
>>> -	=09ranges =3D <0 0 0 0x08000000 0x04000000>,
>>> -	=09	 <1 0 0 0x14000000 0x04000000>,
>>> -	=09	 <2 0 0 0x18000000 0x04000000>,
>>> -	=09	 <3 0 0 0x1c000000 0x04000000>,
>>> -	=09	 <4 0 0 0x0c000000 0x04000000>,
>>> -	=09	 <5 0 0 0x10000000 0x04000000>;
>>> -	};
>>> -
>>> -	panels {
>>> -	=09panel {
>>> -	=09	compatible	=3D "panel";
>>> -	=09	mode	=09=3D "XVGA";
>>> -	=09	refresh	=09=3D <60>;
>>> -	=09	xres	=09=3D <1024>;
>>> -	=09	yres	=09=3D <768>;
>>> -	=09	pixclock	=3D <15748>;
>>> -	=09	left_margin	=3D <152>;
>>> -	=09	right_margin	=3D <48>;
>>> -	=09	upper_margin	=3D <23>;
>>> -	=09	lower_margin	=3D <3>;
>>> -	=09	hsync_len	=3D <104>;
>>> -	=09	vsync_len	=3D <4>;
>>> -	=09	sync	=09=3D <0>;
>>> -	=09	vmode	=09=3D "FB_VMODE_NONINTERLACED";
>>> -	=09	tim2	=09=3D "TIM2_BCD", "TIM2_IPC";
>>> -	=09	cntl	=09=3D "CNTL_LCDTFT", "CNTL_BGR", "CNTL_LCDVCOMP(1)";
>>> -	=09	caps	=09=3D "CLCD_CAP_5551", "CLCD_CAP_565", "CLCD_CAP_888";
>>> -	=09	bpp	=09=3D <16>;
>>> -	=09};
>>> -	};
>>> -
>>> -};
>>> diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp-base-=
gicv3-psci-custom.dts b/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp=
-base-gicv3-psci-custom.dts
>>> deleted file mode 100644
>>> index 984dbca..0000000
>>> --- a/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp-base-gicv3-p=
sci-custom.dts
>>> +++ /dev/null
>>> @@ -1,9 +0,0 @@
>>> -/*
>>> - * Copyright (c) 2013-2017, ARM Limited and Contributors. All rights =
reserved.
>>> - *
>>> - * SPDX-License-Identifier: BSD-3-Clause
>>> - */
>>> -
>>> -/dts-v1/;
>>> -
>>> -/include/ "fvp-base-gicv3-psci-common-custom.dtsi"
>>> diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/rtsm_ve-m=
otherboard-nomap.dtsi b/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/rts=
m_ve-motherboard-nomap.dtsi
>>> deleted file mode 100644
>>> index 739af57..0000000
>>> --- a/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/rtsm_ve-motherbo=
ard-nomap.dtsi
>>> +++ /dev/null
>>> @@ -1,282 +0,0 @@
>>> -// SPDX-License-Identifier: GPL-2.0
>>> -/*
>>> - * ARM Ltd. Fast Models
>>> - *
>>> - * Versatile Express (VE) system model
>>> - * Motherboard component
>>> - *
>>> - * VEMotherBoard.lisa
>>> - *
>>> - * This is a duplicate of rtsm_ve-motherboard.dtsi but not
>>> - * using interrupt-map as this is not properly supported in
>>> - * xen right now
>>> - */
>>> -/ {
>>> -	smb@8000000 {
>>> -	=09motherboard {
>>> -	=09	arm,v2m-memory-map =3D "rs1";
>>> -	=09	compatible =3D "arm,vexpress,v2m-p1", "simple-bus";
>>> -	=09	#address-cells =3D <2>; /* SMB chipselect number and offset */
>>> -	=09	#size-cells =3D <1>;
>>> -	=09	ranges;
>>> -
>>> -	=09	flash@0,00000000 {
>>> -	=09	=09compatible =3D "arm,vexpress-flash", "cfi-flash";
>>> -	=09	=09reg =3D <0 0x00000000 0x04000000>,
>>> -	=09	=09      <4 0x00000000 0x04000000>;
>>> -	=09	=09bank-width =3D <4>;
>>> -	=09	};
>>> -
>>> -	=09	v2m_video_ram: vram@2,00000000 {
>>> -	=09	=09compatible =3D "arm,vexpress-vram";
>>> -	=09	=09reg =3D <2 0x00000000 0x00800000>;
>>> -	=09	};
>>> -
>>> -	=09	ethernet@2,02000000 {
>>> -	=09	=09compatible =3D "smsc,lan91c111";
>>> -	=09	=09reg =3D <2 0x02000000 0x10000>;
>>> -	=09	=09interrupts =3D <0 15 4>;
>>> -	=09	};
>>> -
>>> -	=09	v2m_clk24mhz: clk24mhz {
>>> -	=09	=09compatible =3D "fixed-clock";
>>> -	=09	=09#clock-cells =3D <0>;
>>> -	=09	=09clock-frequency =3D <24000000>;
>>> -	=09	=09clock-output-names =3D "v2m:clk24mhz";
>>> -	=09	};
>>> -
>>> -	=09	v2m_refclk1mhz: refclk1mhz {
>>> -	=09	=09compatible =3D "fixed-clock";
>>> -	=09	=09#clock-cells =3D <0>;
>>> -	=09	=09clock-frequency =3D <1000000>;
>>> -	=09	=09clock-output-names =3D "v2m:refclk1mhz";
>>> -	=09	};
>>> -
>>> -	=09	v2m_refclk32khz: refclk32khz {
>>> -	=09	=09compatible =3D "fixed-clock";
>>> -	=09	=09#clock-cells =3D <0>;
>>> -	=09	=09clock-frequency =3D <32768>;
>>> -	=09	=09clock-output-names =3D "v2m:refclk32khz";
>>> -	=09	};
>>> -
>>> -	=09	iofpga@3,00000000 {
>>> -	=09	=09compatible =3D "simple-bus";
>>> -	=09	=09#address-cells =3D <1>;
>>> -	=09	=09#size-cells =3D <1>;
>>> -	=09	=09ranges =3D <0 3 0 0x200000>;
>>> -
>>> -	=09	=09v2m_sysreg: sysreg@10000 {
>>> -	=09	=09	compatible =3D "arm,vexpress-sysreg";
>>> -	=09	=09	reg =3D <0x010000 0x1000>;
>>> -	=09	=09	gpio-controller;
>>> -	=09	=09	#gpio-cells =3D <2>;
>>> -	=09	=09};
>>> -
>>> -	=09	=09v2m_sysctl: sysctl@20000 {
>>> -	=09	=09	compatible =3D "arm,sp810", "arm,primecell";
>>> -	=09	=09	reg =3D <0x020000 0x1000>;
>>> -	=09	=09	clocks =3D <&v2m_refclk32khz>, <&v2m_refclk1mhz>, <&v2m_clk2=
4mhz>;
>>> -	=09	=09	clock-names =3D "refclk", "timclk", "apb_pclk";
>>> -	=09	=09	#clock-cells =3D <1>;
>>> -	=09	=09	clock-output-names =3D "timerclken0", "timerclken1", "timerc=
lken2", "timerclken3";
>>> -	=09	=09	assigned-clocks =3D <&v2m_sysctl 0>, <&v2m_sysctl 1>, <&v2m_=
sysctl 3>, <&v2m_sysctl 3>;
>>> -	=09	=09	assigned-clock-parents =3D <&v2m_refclk1mhz>, <&v2m_refclk1m=
hz>, <&v2m_refclk1mhz>, <&v2m_refclk1mhz>;
>>> -	=09	=09};
>>> -
>>> -	=09	=09aaci@40000 {
>>> -	=09	=09	compatible =3D "arm,pl041", "arm,primecell";
>>> -	=09	=09	reg =3D <0x040000 0x1000>;
>>> -	=09	=09	interrupts =3D <0 11 4>;
>>> -	=09	=09	clocks =3D <&v2m_clk24mhz>;
>>> -	=09	=09	clock-names =3D "apb_pclk";
>>> -	=09	=09};
>>> -
>>> -	=09	=09mmci@50000 {
>>> -	=09	=09	compatible =3D "arm,pl180", "arm,primecell";
>>> -	=09	=09	reg =3D <0x050000 0x1000>;
>>> -	=09	=09	interrupts =3D <0 9 4 0 10 4>;
>>> -	=09	=09	cd-gpios =3D <&v2m_sysreg 0 0>;
>>> -	=09	=09	wp-gpios =3D <&v2m_sysreg 1 0>;
>>> -	=09	=09	max-frequency =3D <12000000>;
>>> -	=09	=09	vmmc-supply =3D <&v2m_fixed_3v3>;
>>> -	=09	=09	clocks =3D <&v2m_clk24mhz>, <&v2m_clk24mhz>;
>>> -	=09	=09	clock-names =3D "mclk", "apb_pclk";
>>> -	=09	=09};
>>> -
>>> -	=09	=09kmi@60000 {
>>> -	=09	=09	compatible =3D "arm,pl050", "arm,primecell";
>>> -	=09	=09	reg =3D <0x060000 0x1000>;
>>> -	=09	=09	interrupts =3D <0 12 4>;
>>> -	=09	=09	clocks =3D <&v2m_clk24mhz>, <&v2m_clk24mhz>;
>>> -	=09	=09	clock-names =3D "KMIREFCLK", "apb_pclk";
>>> -	=09	=09};
>>> -
>>> -	=09	=09kmi@70000 {
>>> -	=09	=09	compatible =3D "arm,pl050", "arm,primecell";
>>> -	=09	=09	reg =3D <0x070000 0x1000>;
>>> -	=09	=09	interrupts =3D <0 13 4>;
>>> -	=09	=09	clocks =3D <&v2m_clk24mhz>, <&v2m_clk24mhz>;
>>> -	=09	=09	clock-names =3D "KMIREFCLK", "apb_pclk";
>>> -	=09	=09};
>>> -
>>> -	=09	=09v2m_serial0: uart@90000 {
>>> -	=09	=09	compatible =3D "arm,pl011", "arm,primecell";
>>> -	=09	=09	reg =3D <0x090000 0x1000>;
>>> -	=09	=09	interrupts =3D <0 5 4>;
>>> -	=09	=09	clocks =3D <&v2m_clk24mhz>, <&v2m_clk24mhz>;
>>> -	=09	=09	clock-names =3D "uartclk", "apb_pclk";
>>> -	=09	=09};
>>> -
>>> -	=09	=09v2m_serial1: uart@a0000 {
>>> -	=09	=09	compatible =3D "arm,pl011", "arm,primecell";
>>> -	=09	=09	reg =3D <0x0a0000 0x1000>;
>>> -	=09	=09	interrupts =3D <0 6 4>;
>>> -	=09	=09	clocks =3D <&v2m_clk24mhz>, <&v2m_clk24mhz>;
>>> -	=09	=09	clock-names =3D "uartclk", "apb_pclk";
>>> -	=09	=09};
>>> -
>>> -	=09	=09v2m_serial2: uart@b0000 {
>>> -	=09	=09	compatible =3D "arm,pl011", "arm,primecell";
>>> -	=09	=09	reg =3D <0x0b0000 0x1000>;
>>> -	=09	=09	interrupts =3D <0 7 4>;
>>> -	=09	=09	clocks =3D <&v2m_clk24mhz>, <&v2m_clk24mhz>;
>>> -	=09	=09	clock-names =3D "uartclk", "apb_pclk";
>>> -	=09	=09};
>>> -
>>> -	=09	=09v2m_serial3: uart@c0000 {
>>> -	=09	=09	compatible =3D "arm,pl011", "arm,primecell";
>>> -	=09	=09	reg =3D <0x0c0000 0x1000>;
>>> -	=09	=09	interrupts =3D <0 8 4>;
>>> -	=09	=09	clocks =3D <&v2m_clk24mhz>, <&v2m_clk24mhz>;
>>> -	=09	=09	clock-names =3D "uartclk", "apb_pclk";
>>> -	=09	=09};
>>> -
>>> -	=09	=09wdt@f0000 {
>>> -	=09	=09	compatible =3D "arm,sp805", "arm,primecell";
>>> -	=09	=09	reg =3D <0x0f0000 0x1000>;
>>> -	=09	=09	interrupts =3D <0 0 4>;
>>> -	=09	=09	clocks =3D <&v2m_refclk32khz>, <&v2m_clk24mhz>;
>>> -	=09	=09	clock-names =3D "wdogclk", "apb_pclk";
>>> -	=09	=09};
>>> -
>>> -	=09	=09v2m_timer01: timer@110000 {
>>> -	=09	=09	compatible =3D "arm,sp804", "arm,primecell";
>>> -	=09	=09	reg =3D <0x110000 0x1000>;
>>> -	=09	=09	interrupts =3D <0 2 4>;
>>> -	=09	=09	clocks =3D <&v2m_sysctl 0>, <&v2m_sysctl 1>, <&v2m_clk24mhz>=
;
>>> -	=09	=09	clock-names =3D "timclken1", "timclken2", "apb_pclk";
>>> -	=09	=09};
>>> -
>>> -	=09	=09v2m_timer23: timer@120000 {
>>> -	=09	=09	compatible =3D "arm,sp804", "arm,primecell";
>>> -	=09	=09	reg =3D <0x120000 0x1000>;
>>> -	=09	=09	interrupts =3D <0 3 4>;
>>> -	=09	=09	clocks =3D <&v2m_sysctl 2>, <&v2m_sysctl 3>, <&v2m_clk24mhz>=
;
>>> -	=09	=09	clock-names =3D "timclken1", "timclken2", "apb_pclk";
>>> -	=09	=09};
>>> -
>>> -	=09	=09rtc@170000 {
>>> -	=09	=09	compatible =3D "arm,pl031", "arm,primecell";
>>> -	=09	=09	reg =3D <0x170000 0x1000>;
>>> -	=09	=09	interrupts =3D <0 4 4>;
>>> -	=09	=09	clocks =3D <&v2m_clk24mhz>;
>>> -	=09	=09	clock-names =3D "apb_pclk";
>>> -	=09	=09};
>>> -
>>> -	=09	=09clcd@1f0000 {
>>> -	=09	=09	compatible =3D "arm,pl111", "arm,primecell";
>>> -	=09	=09	reg =3D <0x1f0000 0x1000>;
>>> -	=09	=09	interrupt-names =3D "combined";
>>> -	=09	=09	interrupts =3D <0 14 4>;
>>> -	=09	=09	clocks =3D <&v2m_oscclk1>, <&v2m_clk24mhz>;
>>> -	=09	=09	clock-names =3D "clcdclk", "apb_pclk";
>>> -	=09	=09	arm,pl11x,framebuffer =3D <0x18000000 0x00180000>;
>>> -	=09	=09	memory-region =3D <&v2m_video_ram>;
>>> -	=09	=09	max-memory-bandwidth =3D <130000000>; /* 16bpp @ 63.5MHz */
>>> -
>>> -	=09	=09	port {
>>> -	=09	=09	=09v2m_clcd_pads: endpoint {
>>> -	=09	=09	=09	remote-endpoint =3D <&v2m_clcd_panel>;
>>> -	=09	=09	=09	arm,pl11x,tft-r0g0b0-pads =3D <0 8 16>;
>>> -	=09	=09	=09};
>>> -	=09	=09	};
>>> -
>>> -	=09	=09	panel {
>>> -	=09	=09	=09compatible =3D "panel-dpi";
>>> -
>>> -	=09	=09	=09port {
>>> -	=09	=09	=09	v2m_clcd_panel: endpoint {
>>> -	=09	=09	=09	=09remote-endpoint =3D <&v2m_clcd_pads>;
>>> -	=09	=09	=09	};
>>> -	=09	=09	=09};
>>> -
>>> -	=09	=09	=09panel-timing {
>>> -	=09	=09	=09	clock-frequency =3D <63500127>;
>>> -	=09	=09	=09	hactive =3D <1024>;
>>> -	=09	=09	=09	hback-porch =3D <152>;
>>> -	=09	=09	=09	hfront-porch =3D <48>;
>>> -	=09	=09	=09	hsync-len =3D <104>;
>>> -	=09	=09	=09	vactive =3D <768>;
>>> -	=09	=09	=09	vback-porch =3D <23>;
>>> -	=09	=09	=09	vfront-porch =3D <3>;
>>> -	=09	=09	=09	vsync-len =3D <4>;
>>> -	=09	=09	=09};
>>> -	=09	=09	};
>>> -	=09	=09};
>>> -
>>> -	=09	=09virtio-block@130000 {
>>> -	=09	=09	compatible =3D "virtio,mmio";
>>> -	=09	=09	reg =3D <0x130000 0x200>;
>>> -	=09	=09	interrupts =3D <0 42 4>;
>>> -	=09	=09};
>>> -	=09	};
>>> -
>>> -	=09	v2m_fixed_3v3: v2m-3v3 {
>>> -	=09	=09compatible =3D "regulator-fixed";
>>> -	=09	=09regulator-name =3D "3V3";
>>> -	=09	=09regulator-min-microvolt =3D <3300000>;
>>> -	=09	=09regulator-max-microvolt =3D <3300000>;
>>> -	=09	=09regulator-always-on;
>>> -	=09	};
>>> -
>>> -	=09	mcc {
>>> -	=09	=09compatible =3D "arm,vexpress,config-bus";
>>> -	=09	=09arm,vexpress,config-bridge =3D <&v2m_sysreg>;
>>> -
>>> -	=09	=09v2m_oscclk1: oscclk1 {
>>> -	=09	=09	/* CLCD clock */
>>> -	=09	=09	compatible =3D "arm,vexpress-osc";
>>> -	=09	=09	arm,vexpress-sysreg,func =3D <1 1>;
>>> -	=09	=09	freq-range =3D <23750000 63500000>;
>>> -	=09	=09	#clock-cells =3D <0>;
>>> -	=09	=09	clock-output-names =3D "v2m:oscclk1";
>>> -	=09	=09};
>>> -
>>> -	=09	=09reset {
>>> -	=09	=09	compatible =3D "arm,vexpress-reset";
>>> -	=09	=09	arm,vexpress-sysreg,func =3D <5 0>;
>>> -	=09	=09};
>>> -
>>> -	=09	=09muxfpga {
>>> -	=09	=09	compatible =3D "arm,vexpress-muxfpga";
>>> -	=09	=09	arm,vexpress-sysreg,func =3D <7 0>;
>>> -	=09	=09};
>>> -
>>> -	=09	=09shutdown {
>>> -	=09	=09	compatible =3D "arm,vexpress-shutdown";
>>> -	=09	=09	arm,vexpress-sysreg,func =3D <8 0>;
>>> -	=09	=09};
>>> -
>>> -	=09	=09reboot {
>>> -	=09	=09	compatible =3D "arm,vexpress-reboot";
>>> -	=09	=09	arm,vexpress-sysreg,func =3D <9 0>;
>>> -	=09	=09};
>>> -
>>> -	=09	=09dvimode {
>>> -	=09	=09	compatible =3D "arm,vexpress-dvimode";
>>> -	=09	=09	arm,vexpress-sysreg,func =3D <11 0>;
>>> -	=09	=09};
>>> -	=09	};
>>> -	=09};
>>> -	};
>>> -};
>>> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platfor=
ms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
>>> index eeb0571..5622ae7 100644
>>> --- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
>>> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
>>> @@ -21,12 +21,6 @@ KMACHINE_foundation-armv8 =3D "fvp"
>>> #
>>> COMPATIBLE_MACHINE_fvp-base =3D "fvp-base"
>>> KMACHINE_fvp-base =3D "fvp"
>>> -SRC_URI_append_fvp-base =3D " file://dts/arm;subdir=3Dadd-files"
>>> -
>>> -do_patch_append_fvp-base() {
>>> -    tar -C ${WORKDIR}/add-files/dts -cf - arm | \
>>> -        tar -C arch/arm64/boot/dts -xf -
>>> -}
>>>=20
>>> #
>>> # Juno KMACHINE
>>> --=20
>>> 2.17.1
>>>=20
>>>=20
>>=20
>=20
>>=20

