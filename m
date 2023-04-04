Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D10C6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 08:24:30 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.59])
 by mx.groups.io with SMTP id smtpd.web11.96331.1680596667717627064
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Apr 2023 01:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hs9mdglh;
 spf=pass (domain: arm.com, ip: 40.107.104.59, mailfrom: adam.johnston@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4x2Pd5vgOwPrwbUlZL/np/VrhQ2vQ9xCzJ5rTncuu4=;
 b=hs9mdglhYR0E8g0esTGGfTqUp0FVZDz4ZUXI841r95uou62aTBnI5c92K3KnRcsJKZI1Uzzo5QY6dTiAlw2PjXMyRo/AeGJwkRHTdpi1dtK9vQ4YZ6DUTpRH1GRqP8eKhmxKfpz9tbf4i5V4t3sZLV/0PP8wKs+HqNB8upK4NWE=
Received: from AS9PR06CA0567.eurprd06.prod.outlook.com (2603:10a6:20b:485::35)
 by PAVPR08MB9040.eurprd08.prod.outlook.com (2603:10a6:102:32d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 08:24:22 +0000
Received: from AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:485:cafe::29) by AS9PR06CA0567.outlook.office365.com
 (2603:10a6:20b:485::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22 via Frontend
 Transport; Tue, 4 Apr 2023 08:24:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT016.mail.protection.outlook.com (100.127.140.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.18 via Frontend Transport; Tue, 4 Apr 2023 08:24:22 +0000
Received: ("Tessian outbound 99a3040377ca:v136"); Tue, 04 Apr 2023 08:24:22 +0000
X-CR-MTA-TID: 64aa7808
Received: from 021198704a81.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2116EB71-C039-421F-867F-13E871AB28D7.1;
	Tue, 04 Apr 2023 08:24:16 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 021198704a81.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 04 Apr 2023 08:24:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Esn/R09Q1wmKEPcEPVZPvYxbDJRqZqgoMHQx6pkB47jJhDAV7IH/yRW5jGk2lQIDoU81+Vd/HA3ZEYIUrnFJY34Z3BJZweUbID0oJ2AUSFuJ8Hqx3piaoZWmBvpzkuw3eI33qQNc0XN3BhXFcw2Htk9ddpbmD2VnMYvkzKTMbtG2hLt0rpeZo1Qy4DF8fRrAEcEMrMkPtSrnGe4cYrVqPkwfKDMVqX0Y43DQu15X3cAkzhJbkfy3Zz+gnqfDa1vpNRYsWx/5Mhc5Gbu5J/V0XPoAL7/MHAl+lK7qmWCagfzC1/gLrsmHx+7JZlR02SszZM23lq3CDMqXsfi38ZcVaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4x2Pd5vgOwPrwbUlZL/np/VrhQ2vQ9xCzJ5rTncuu4=;
 b=oZS2SRhpBKVL9A0bVyAyPOMo/kKDm9ZBEljuBfc+GmHRX1sNW/FiBEQi1H+EcPo5jZsSLekfo7I32PjjY1z7T15Z1veqcpHvqWSNdlJBibMA3GKbWTuvXkt+jHL55dllXDklluMHlkIxD0m9OyMueAC6pjWgzxYgsCkEn9yjeNiesUV5+4Cmd+FntcagL19ThXkCHYhMGE4ZchMP9jrhrqQzfglPYYU/UcKomiosEKbAKv2eblBsiGadNRxEpZD8AQIcegNIu/YYVk70MbZWt6EDSzRIru7A/rkKFhEkN9GvpqmePQXlM8PYGnL/AnNNtY9/uE9rjPYTZ9nF/mDaBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4x2Pd5vgOwPrwbUlZL/np/VrhQ2vQ9xCzJ5rTncuu4=;
 b=hs9mdglhYR0E8g0esTGGfTqUp0FVZDz4ZUXI841r95uou62aTBnI5c92K3KnRcsJKZI1Uzzo5QY6dTiAlw2PjXMyRo/AeGJwkRHTdpi1dtK9vQ4YZ6DUTpRH1GRqP8eKhmxKfpz9tbf4i5V4t3sZLV/0PP8wKs+HqNB8upK4NWE=
Received: from PAXPR08MB6432.eurprd08.prod.outlook.com (2603:10a6:102:154::12)
 by DB8PR08MB5466.eurprd08.prod.outlook.com (2603:10a6:10:114::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 08:24:15 +0000
Received: from PAXPR08MB6432.eurprd08.prod.outlook.com
 ([fe80::ee8f:d071:c766:9288]) by PAXPR08MB6432.eurprd08.prod.outlook.com
 ([fe80::ee8f:d071:c766:9288%8]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 08:24:14 +0000
From: Adam Johnston <Adam.Johnston@arm.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Ross
 Burton <Ross.Burton@arm.com>, nd <nd@arm.com>
Subject: RE: [meta-arm] [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA devkit to
 3.20 for N1SDP
Thread-Topic: [meta-arm] [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA devkit to
 3.20 for N1SDP
Thread-Index: AQHZZkMLlJYm/4A5wE+gvm9fShyImK8aRfKAgACHQCA=
Date: Tue, 4 Apr 2023 08:24:14 +0000
Message-ID: 
 <PAXPR08MB6432BC10804AF2B98275C3E6E9939@PAXPR08MB6432.eurprd08.prod.outlook.com>
References: <20230403154306.3422-1-adam.johnston@arm.com>
 <20230403154306.3422-2-adam.johnston@arm.com>
 <20230404000559.GA9226@denix.org>
In-Reply-To: <20230404000559.GA9226@denix.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: DF710A3F9DEB3443B1B48A4FDEA00B3D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PAXPR08MB6432:EE_|DB8PR08MB5466:EE_|AM7EUR03FT016:EE_|PAVPR08MB9040:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea8a654-81a5-4b58-d772-08db34e5fe6d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 kfUcgGW3caB6ZdgIocTlkh46wSfZqHK9XWjPsMc00CzCpFdlS80bWhBceV7AIDRsWMWlPsYCwMctnjOx3uN0J0oArotS6mAo452GYTX3nvVpWJR3zMdrv6EywadJWd052o3DTdgqGCmlE6ZiO7blCh8OJtZELpecTxgwYFJUPWoQZ5sQA721XaRB/1U0fIOHp0FN2Nr4usdohpsYbNaMauzGBOYeicV6BoV1f9qXQHy3//1Ad7oU7/DEpUxKAX5ENFWqgDW1BopWZN7Q8R1wQ07bWBPU0H5kS7qHyURcWeb1rtIPr8HcclElUbALaiIBIFcqXiBRFNGFxSe4XDeZlI2JDKinwNhO8nPtD8EArf2h1B1aACi8nPibsxXJUm/gGzd5I643V1+ESoMkVMM0DfZck9aON1bac7H7KDHNWcKayqKCba5E04+JIJ7PdkoHndnI14AW+2LLJUvZ4cX4jbymhiY1pFu4+plOvbTUFNKjdCjf8UzGLz9NBIaxyCuH5X4tldQVst4hv736vKjMjBCvFCyMOlLm5jd1iJZDKMvpnLBOWL1QW2ewXXXnfv5kEi0u/dCagCJOIXJVq0HyR+/RRXlS5//feLeEszobF2E1s5CaX2yXVXaSBzFYwa4+A574e4r9fhs/1qeLPA+jc2tp+Os1rEUCXbZJeAKgGXU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6432.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199021)(66946007)(26005)(9686003)(6506007)(53546011)(83380400001)(122000001)(66476007)(66556008)(38100700002)(41300700001)(7696005)(71200400001)(66446008)(186003)(54906003)(316002)(478600001)(2906002)(15650500001)(33656002)(86362001)(64756008)(76116006)(8676002)(4326008)(6916009)(55016003)(5660300002)(38070700005)(8936002)(52536014)(32563001)(473944003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5466
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4474317c-150d-442b-fd1f-08db34e5f9a5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YQCUgJS3mOO12W4DpOLGycNuI9bo93D2lzPlrGzNm4PMJXH+UNmnwomU0xqpK9EH75lkvQ16VhXTHPzu81LDHLsI/VBLIws8rsZgxGjvKgDIFkZF7+/VPcLFVgYCjMAWIQ35Qc54k6otCD9/b9tbPvyd6AsMm4ZBqErlkN1MFRabLzYlIsgUBw3sR17v4U9HyHrc8aGhetRV9XbZgcIerN2sLKmuDQzT0vlO6+x6kmplMCuV5JwqIbCmKguh22MJR9OkLD4BEmsyQC8PzIcRQmiDb+bpp2P6ii7U7QxJEQgjlt9XFmAdJgVDZXZughdwfR7u1jKHVCNuD/fA1Av6w63Vf0NW8ybM35ssk+4TELmQHu6J45j34UZinhtVgI6AsGhyPWVDa9vYwcUsIfu5MVAiyRfhRLuQ0T3ARtfEjXRbCz1nc6EOnAdFBehn9N972sMjiuiSRQKZk7dAzBc9HvVlu4bH2nKejimVYLrj+fETkCJyx18DqpzIGiNe7J31RtlDSrNO8x/LNR9vM2ZFRWnkvnyZXk0c5A6I0k9ks18sx70szdgQwoFNSi0RwxIu2/AP0LbkPquG52T41bcke6fFervldtWbdQI8QTPj3o9+wN/YCyQThZzSjevbglDmSL9tdNUgnVfGKjNPYWXnnJflWJWc7Ut12W+EKc81dAXHg2LIe+Ze2FwbhAG2tN//nBZR8RGVRuX0MeFJzSnrgQ6V50Du6qNSCLT22PdWYl4f/+PZkXVlNVIb2YakSQyv
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(86362001)(82310400005)(15650500001)(2906002)(33656002)(40480700001)(55016003)(336012)(7696005)(186003)(83380400001)(47076005)(53546011)(6506007)(26005)(9686003)(4326008)(36860700001)(70206006)(70586007)(478600001)(8676002)(40460700003)(82740400003)(81166007)(356005)(5660300002)(6862004)(41300700001)(54906003)(316002)(52536014)(8936002)(32563001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 08:24:22.3198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea8a654-81a5-4b58-d772-08db34e5fe6d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9040
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Apr 2023 08:24:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4537

The only other platform which also enables OP-TEE OS is Corstone-1000, but =
they didn't enable OP-TEE OS TA Devkit (required for OP-TEE xtest)
I agree it would make sense to update/enable both at the same time for CI (=
as long as it doesn't affect the Corstone-100 BSPs)

-----Original Message-----
From: Denys Dmytriyenko <denis@denix.org>=20
Sent: Tuesday, April 4, 2023 1:06 AM
To: Adam Johnston <Adam.Johnston@arm.com>
Cc: meta-arm@lists.yoctoproject.org; Ross Burton <Ross.Burton@arm.com>; nd =
<nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA devkit =
to 3.20 for N1SDP

On Mon, Apr 03, 2023 at 04:43:06PM +0100, Adam Johnston wrote:
> From: Adam Johnston <adam.johnston@arm.com>
>=20
> As optee-os for the N1SDP has been updated to 3.20 we need to do the=20
> same for optee-os-tavdekit. Otherwise errors will be seen if/when=20
> optee-os-tavdekit is built.

So, why only update it for N1SDP and not for everyone globally in meta-arm?


> Signed-off-by: Adam Johnston <adam.johnston@arm.com>
> ---
>  .../optee/optee-os-tadevkit_3.18.0.bbappend   |  1 -
>  .../optee/optee-os-tadevkit_3.20.0.bbappend   |  6 +++++
>  .../optee/optee-os-tadevkit_3.20.0.bb         | 24 +++++++++++++++++++
>  3 files changed, 30 insertions(+), 1 deletion(-)  create mode 100644=20
> meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bbappend
>  create mode 100644=20
> meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
>=20
> diff --git=20
> a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bbappen
> d=20
> b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bbappen
> d
> index 9a210832..6a22d47e 100644
> ---=20
> a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bbappen
> d
> +++ b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bba
> +++ ppend
> @@ -2,6 +2,5 @@
> =20
>  MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?=3D ""
>  MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:tc =3D "optee-os-generic-tc.inc"
> -MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
> =20
>  require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}
> diff --git=20
> a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bbappen
> d=20
> b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bbappen
> d
> new file mode 100644
> index 00000000..e09c4a5e
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bba
> +++ ppend
> @@ -0,0 +1,6 @@
> +# Machine specific configurations
> +
> +MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?=3D ""
> +MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
> +
> +require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}
> diff --git=20
> a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb=20
> b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
> new file mode 100644
> index 00000000..202caa54
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
> @@ -0,0 +1,24 @@
> +require optee-os_3.20.0.bb
> +
> +SUMMARY =3D "OP-TEE Trusted OS TA devkit"
> +DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
> +HOMEPAGE =3D "https://www.op-tee.org/"
> +
> +DEPENDS +=3D "python3-pycryptodome-native"
> +
> +do_install() {
> +    #install TA devkit
> +    install -d ${D}${includedir}/optee/export-user_ta/
> +    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> +        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> +    done
> +}
> +
> +do_deploy() {
> +	echo "Do not inherit do_deploy from optee-os."
> +}
> +
> +FILES:${PN} =3D "${includedir}/optee/"
> +
> +# Build paths are currently embedded
> +INSANE_SKIP:${PN}-dev +=3D "buildpaths"
> --
> 2.38.1

