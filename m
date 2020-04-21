Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.44])
 by mx.groups.io with SMTP id smtpd.web11.6283.1587466358809605875
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Apr 2020 03:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Mxa1aVVS;
 spf=pass (domain: arm.com, ip: 40.107.7.44, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HciS8Rkymii347dAL0Jz9u8ERg/oF/KWJqSP4xVMbAI=;
 b=Mxa1aVVSgXEuNzj+/PzKvs1HD+GoYAxwep2XYBu0WmSWsd7cyF0MQCxTYdk8zT6uF6JSWYKFXckXjPVAawDOOqqOzlHt+rgkvtT1D7hlXFNQwWSYb+j/UD74K+mHn76CwY8MpXl3jl3Roj7EpasxPx/Cxhpl3OPB7NrM7tlIXT0=
Received: from AM6PR10CA0033.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::46)
 by DB6PR08MB2678.eurprd08.prod.outlook.com (2603:10a6:6:1b::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 10:52:36 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::88) by AM6PR10CA0033.outlook.office365.com
 (2603:10a6:209:89::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Tue, 21 Apr 2020 10:52:36 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.18 via Frontend Transport; Tue, 21 Apr 2020 10:52:35 +0000
Received: ("Tessian outbound 3a3e6dcbad0e:v53"); Tue, 21 Apr 2020 10:52:35 +0000
X-CR-MTA-TID: 64aa7808
Received: from da1987f448e9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EDB67CBE-E618-4579-A2C4-2A527A98CC2F.1;
	Tue, 21 Apr 2020 10:52:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id da1987f448e9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Apr 2020 10:52:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSsht6z69HFTDfTUAHUWu9kkr38IkTJ7Vm+ML23JykpNOTLp8SMdhJ5U9rj6BxMHTyZpRxtwLwv8H9aQ6eFJ9PqlLxTuxusim/hI/+VTVbeqFhuZO+T5qS0xja8GT4SKqvJZkeAB4Lc4iSw+mFGi0us9uyCU6umbLs7CQ6kgya3OVbHI4USAp9sa6LPBO9VqixM2tSl4iUMjzIn6IeLP1BhRnkKvGU/hiTtEWo5EYd+/jWaxeL9EZMTE6QL2rYq6WQRTz90VS+7qB/YOBZkZrubUDaY6/eYFsuDKrm7eZlww21ZVFXThzehKaZe/xVpgCJmoS1q07KOlhfTl4ZnCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HciS8Rkymii347dAL0Jz9u8ERg/oF/KWJqSP4xVMbAI=;
 b=Vmp3Lyd4nxgqcdTouSV1lzGEeFQAfjDyciUDM6fKbyychr6cChgqyGFYj9KiFbkgto7Zr37YKftSxoxsJOILjNQPsKGCb4cdm5Svdii898cFlTPQxyYIoKPTHBcPYhLsKk5MYxDtq9LSxd8YAH1N2OeovW8mQN+l0ytiUYOvS3boQEn2AIsbGWo6eonkY4q6H8wby4sKbCh9ee0eF8rIfx9WGGzsKppUlPp93y9meaJoc3oKRrcflz+P15W55hKo7fMX660pHDxLdzAJUcTDHLZR9nbpEK0ImYzSMF4CHynu9LRdW0lYrx1/Ir7cwmooAl9Gf7/ywDnUvIONsflWMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HciS8Rkymii347dAL0Jz9u8ERg/oF/KWJqSP4xVMbAI=;
 b=Mxa1aVVSgXEuNzj+/PzKvs1HD+GoYAxwep2XYBu0WmSWsd7cyF0MQCxTYdk8zT6uF6JSWYKFXckXjPVAawDOOqqOzlHt+rgkvtT1D7hlXFNQwWSYb+j/UD74K+mHn76CwY8MpXl3jl3Roj7EpasxPx/Cxhpl3OPB7NrM7tlIXT0=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4017.eurprd08.prod.outlook.com (2603:10a6:208:12a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Tue, 21 Apr
 2020 10:52:29 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2921.027; Tue, 21 Apr 2020
 10:52:29 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/2] arm-autonomy: Fix circle dependency in xen-dtb
Thread-Topic: [meta-arm] [PATCH 1/2] arm-autonomy: Fix circle dependency in
 xen-dtb
Thread-Index: AQHWF8qGUcrB6rMvW0q2PLup+1Fdj6iDZhSw
Date: Tue, 21 Apr 2020 10:52:28 +0000
Message-ID: 
 <AM0PR08MB3987291AE40A77D06E8C4D2C92D50@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200421104856.4389-1-bertrand.marquis@arm.com>
In-Reply-To: <20200421104856.4389-1-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: f96333a9-742d-4f8e-b2cb-2c5a19112dfd.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 675cf328-70d2-424b-a3fe-08d7e5e219ef
x-ms-traffictypediagnostic: AM0PR08MB4017:|DB6PR08MB2678:
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB267872C2333EF07DBB82AAF792D50@DB6PR08MB2678.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1051;OLM:1051;
x-forefront-prvs: 038002787A
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(66476007)(186003)(8936002)(8676002)(81156014)(478600001)(5660300002)(55016002)(4326008)(9686003)(316002)(86362001)(6916009)(66946007)(26005)(6506007)(53546011)(7696005)(64756008)(2906002)(71200400001)(66446008)(52536014)(76116006)(66556008)(33656002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 klHDDJkVJ8snD5W3BTVhM9JJixsczTX301g3iyC6Qu4Gqe6nQ8DcISvdD8Jkg99db6zXYL0QbhlRfcu/gi4empjrtUEj/LCd74t8cK0O1C53RXgL6/BlJQ0suGc3Rt3RudMkmcO95d90UK1+UiRJYrrzZKmtGrxIofK3gEIjxBrZ/MyHcJtpGEpfids5TsbKdGohHz6EILcfBNV6n9MVfPw6PifpeUPnpn5P7xK9t5B/gM97ifMT4w4vrY+w3vJmYUcMoXzhvVAU7aW2zZje4p+rzq+sRzSZE5aPqBINaq5HZBe5tBjpx0z6kaXMsFQqPOVYIF5/VA3XYAwb3z2qTLZHO1A8cUSY98WwsZQZ+Y9lHXUrm5pTayGj6+qC+OSaGxOflVuYgA2ctx7Al7x8oNz8D/n6mDjSahgBAD51bqUz1g39g35nl+74pb8iNksL
x-ms-exchange-antispam-messagedata: 
 25kE3bJ/FzU+8a3m/O5Yz3kuivfo41dX8HsLbmtDzs4frfpU4mWrCxdFEfYFHxYwUwQRZ1Ob9XhbN+WBHxiHIOiXW8eqSxfLaY1B7u82ClEUtdxvCwAlHPG2k8gBXl2VNvHT3872dx42dbUo+Z9dBw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4017
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966005)(86362001)(6506007)(36906005)(26005)(82740400003)(7696005)(70586007)(70206006)(81166007)(186003)(47076004)(8676002)(336012)(2906002)(55016002)(53546011)(9686003)(478600001)(6916009)(356005)(5660300002)(4326008)(8936002)(52536014)(316002)(81156014)(33656002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	211d1767-1bc0-4d06-9088-08d7e5e2160c
X-Forefront-PRVS: 038002787A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RONzgPwT5f1IiSyQmPN5+KgdeRR0NtCVVZLyWOgswqeuUqgvJLMbNtazd84RKcb/XFxiTYn6a1hGpZfh/hH41vmAfAP5ajfbtbiO3RjO9d3ONtUmBJoCIUCEEKvgJgqfiUD7bIKze6U6GBhX6lXfvb4Z/+y4CA+knybqRMYmvg6EIo5NDE5DMsjqITsPNEcrNKTT7UsBL4Bj17poArMFM0ktRQShgOsMXi1CZwvCr6m8Cy/CZWQknyst0lEHshIr+WU9iVCTr6jZBMFgsdg5NpeaKy2/N/80w462O+TLkA3rmbkx76EyK11InipVsCljfJf0xC6OGUzoInEo3hAmomy5yh1V93w84W/n3Mxhou8Wujo6f7xULdSaIpkULfA1dOh8DqjeKwH7NMipHjoKcF81NZl8xtYUyz1257gC6jldqX2LLwnoxw19WpiTngfxWyUhtwhxi3932R1tZQDMLHmcsPkMORCO+72Xt2al6j1E0LEJTWOfoFFVGYh1UhmsPI3Gb/kodpq/4+/Ece9EUA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 10:52:35.5678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 675cf328-70d2-424b-a3fe-08d7e5e219ef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2678
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Bertrand Marquis via lists.yoctoproject.org
> Sent: 21 April 2020 11:49
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH 1/2] arm-autonomy: Fix circle dependency in
> xen-dtb
>=20
> Solve circle dependency in xen-devicetree when initramfs is activated as
> compile depends on kernel:do_deploy and xen-devicetree is needed to
> create the arm-autonomy-host-image-minimal.
> Move all actions in do_deploy so that only do_deploy depends on the kerne=
l
> do_deploy.
>=20
> Change-Id: I011df8f225550afa71b18a88e0ebe01debca0bed
> Issue-Id: SCM-949
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../xen-devicetree/xen-devicetree.bb          | 24 +++++++++++--------
>  1 file changed, 14 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-
> devicetree.bb b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-
> devicetree.bb
> index 0bb9def..cef5f79 100644
> --- a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-
> devicetree.bb
> +++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-
> devicetree.b
> +++ b
> @@ -29,7 +29,14 @@ inherit nopackages deploy
>=20
>  DEPENDS +=3D "dtc-native"
>=20
> -do_compile() {
> +do_configure[noexec] =3D "1"
> +do_compile[noexec] =3D "1"
> +do_install[noexec] =3D "1"
> +
> +do_deploy() {
> +    if [ ! -f ${WORKDIR}/xen.dtsi.in ]; then
> +        die "xen.dtsi.in does not exist"
> +    fi
>      cat ${WORKDIR}/xen.dtsi.in \
>          | sed -e
> "s,###XEN_DOM0_BOOTARGS###,${XEN_DEVICETREE_DOM0_BOOTARGS},"
> \
>          | sed -e
> "s,###XEN_XEN_BOOTARGS###,${XEN_DEVICETREE_XEN_BOOTARGS}," \
> @@ -47,22 +54,19 @@ do_compile() {
>=20
>          # Add external includes
>          for inc in ${XEN_DEVICETREE_DTSI_MERGE}; do
> +            if [ ! -f ${WORKDIR}/${inc} ]; then
> +                die "Wrong file in XEN_DEVICETREE_DTSI_MERGE:
> ${WORKDIR}/${inc} does not exist"
> +            fi
>              echo "/include/ \"$inc\"" >> ${WORKDIR}/dom0-linux.dts
>          done
>=20
>          rdtbnoextn=3D`basename $dtbf ".dtb"`
>          dtc -I dts -O dtb \
>              -o ${WORKDIR}/${rdtbnoextn}-xen.dtb ${WORKDIR}/dom0-linux.dt=
s
> -    done
> -}
> -do_compile[depends] +=3D "${XEN_DEVICETREE_DEPEND}"
> -
> -do_deploy() {
> -    # install generated dtbs
> -    for dtbf in ${XEN_DEVICETREE_DTBS}; do
> -        rdtbnoextn=3D`basename $dtbf ".dtb"`
>          install -m 644 ${rdtbnoextn}-xen.dtb ${DEPLOYDIR}/.
>      done
>  }
> +do_deploy[depends] +=3D "${XEN_DEVICETREE_DEPEND}"
> +
> +addtask deploy after do_install
>=20
> -addtask deploy before do_build after do_compile
> --
> 2.17.1

