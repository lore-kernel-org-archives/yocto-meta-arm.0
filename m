Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.68])
 by mx.groups.io with SMTP id smtpd.web12.25145.1605711165461020699
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 06:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=lfXw/rL/;
 spf=pass (domain: arm.com, ip: 40.107.2.68, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfhI60jDNInRT7AZCdMAZko+aXYilAOpbf45WcBR2xQ=;
 b=lfXw/rL/nLJYDsFl76wtspUeeOwukev5ZAIvrBAQtfBVRQ6NnOYOyCiKxljoUyK0QEBrwWBwms+1RnLmWbXfM1tiOsRhXcNbATWueO4ePXFFu8aezBLTecjxINXWSsM08aUvard8T7bj/H8t6jIIAyv0dVCbXwlbzg8baOpcv00=
Received: from DB6PR1001CA0044.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::30)
 by AM5PR0801MB1955.eurprd08.prod.outlook.com (2603:10a6:203:46::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 14:52:42 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::4c) by DB6PR1001CA0044.outlook.office365.com
 (2603:10a6:4:55::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 14:52:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 14:52:42 +0000
Received: ("Tessian outbound fcd5bc555ddc:v71"); Wed, 18 Nov 2020 14:52:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d5e4f536cbf97d61
X-CR-MTA-TID: 64aa7808
Received: from 636493ce5863.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A15FA5BE-C2D9-44BF-8C5E-81EF0D3444F2.1;
	Wed, 18 Nov 2020 14:52:36 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 636493ce5863.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 18 Nov 2020 14:52:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CH+GfGB5i8b+9dOj/ndy8OY32TsDKqzNyh2isau3UkHAe4JNlAH+cVACiRALbjIJtEH0KRzeJ0QaTxrWnFb/4Hx9HeFRRZGvQlxUT/bROuUFum1Hy77jPNu4jjGZ7CeiaMYD/jB+oDwmtHFyy+oVTAgAVdUDuHeZJcE6+m/6jbkb8Fb2xbpIUK0f/bs1Vjf1fJatWKBuigmnqS9XeZkVL2zdORuGRqghCyLNKtJ45DWefIqRTeHhaz56jOsjiKnfk0X8NZE/Qv5XSUcVC5s5yX729XuVvW9EUgbreAuI2qucbaxn4hsZmiOJIBh1HPSydTUV0sRkh628JdQFCrLutg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfhI60jDNInRT7AZCdMAZko+aXYilAOpbf45WcBR2xQ=;
 b=f3oywFHjMB/lwWCCt/odB7hJTGGvXy4kLCaASD05DTgJKl7q+1yP+0h5tAvQc1vWCsh1KZUefH1DknXsN8zc61t22/Md2seJZZOrdoNYDRxSUsBJA7NM9/OZJwr9zvg4mIQVyjN7bV1e02VuztpOtCG0PPcJmbZ3jGP5u9aVXXGMtZpNn3gaZ32ScGxuRTAdiiCz7o2CUN2WFQGlWrHu5UKE7z60aqZDJ0g6tv0dL3dObW4G1T4dMQzFTI2wBpPJHDoA8bEjE7jzJFdxB9t018GHsoGzwfyMcBvqXfOq1tJcMEtvJgFuG6pvGuKWGqOfJfzT54AgY2DHMEwAMPr8Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfhI60jDNInRT7AZCdMAZko+aXYilAOpbf45WcBR2xQ=;
 b=lfXw/rL/nLJYDsFl76wtspUeeOwukev5ZAIvrBAQtfBVRQ6NnOYOyCiKxljoUyK0QEBrwWBwms+1RnLmWbXfM1tiOsRhXcNbATWueO4ePXFFu8aezBLTecjxINXWSsM08aUvard8T7bj/H8t6jIIAyv0dVCbXwlbzg8baOpcv00=
Received: from DB7PR08MB3420.eurprd08.prod.outlook.com (2603:10a6:10:4a::15)
 by DB7PR08MB3484.eurprd08.prod.outlook.com (2603:10a6:10:45::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 14:52:34 +0000
Received: from DB7PR08MB3420.eurprd08.prod.outlook.com
 ([fe80::48de:b4ec:3659:dd30]) by DB7PR08MB3420.eurprd08.prod.outlook.com
 ([fe80::48de:b4ec:3659:dd30%4]) with mapi id 15.20.3499.034; Wed, 18 Nov 2020
 14:52:34 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: Jon Mason <jdmason@kudzu.us>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/n1sdp: remove swap parition entry from wic image
Thread-Topic: [meta-arm] [PATCH] arm-bsp/n1sdp: remove swap parition entry
 from wic image
Thread-Index: AQHWuQTAkp42slI1Lki3mKdaQsPKPanK1p6AgAMr6Fk=
Date: Wed, 18 Nov 2020 14:52:34 +0000
Message-ID: 
 <DB7PR08MB34203A01535216DAF3987247FAE10@DB7PR08MB3420.eurprd08.prod.outlook.com>
References: 
 <20201112150138.30489-1-khasim.mohammed@arm.com>,<20201116142526.GC20627@kudzu.us>
In-Reply-To: <20201116142526.GC20627@kudzu.us>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.105.53]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6c6e7c53-8004-4864-ada6-08d88bd19a12
x-ms-traffictypediagnostic: DB7PR08MB3484:|AM5PR0801MB1955:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB19550718C6582BD9CC24CDFBFAE10@AM5PR0801MB1955.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 PqtoGrRuSwQ+qqB4xibsUbUNKT+srHuPtZ4RBjxOqvx9Ny3ahM+TI0Wtt/OcFkbDNy5Fn4dIy+XgMPBExIhFXEno7Zb0gjIxgXpL4SBT73My9l6fWyK2cOkTEuIZ4hODX2Pf21NC+xjrxXSOghfLH/eK9EsSRzdpxjgoOa3jHJgAFAAceiZljV1n1CBjIy2c7l8PTpRvmoosKE4LyzRM7kTBcJXlQrgGMj6+yvfMS5LmzzQHtB17drTvSXSpEAKd/yIGZouUx7y+jm7+tPqrgP8LG9Qy3gjxtdxL13mk7i8fmZ8xGxEECMNM+mJPN3OXp7g/fQ3/YVt7NX+4V/v3RI0yN1qhR/Ieo6Of3T9KXtoyzodZhSK0hNzwt3J1vs2AEQUJQ9VoeVm2MtLBsYrDJ4r+2AZtI+Oplr9KekjhiDlHtA0giZUVWRHI972B8u95ip8n/4j71eRTMqtfJbvEL92Xv52h9lODQ4NnIafm1ws=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(54906003)(64756008)(76116006)(8936002)(478600001)(7696005)(6506007)(26005)(55016002)(4326008)(8676002)(6916009)(186003)(53546011)(2906002)(9686003)(316002)(86362001)(66476007)(83380400001)(52536014)(66446008)(33656002)(66556008)(966005)(91956017)(5660300002)(71200400001)(66946007)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 cm2sRzznY01nZwl58CmIPhVZPmHjI9fY2IR9S784TQZnPAxTS+lJb7azT3WizaGz3gwPLTXcmzsZh3Glt8CpbDLnIQ++LOujYbtyfhrKgsmj01NbfLWZUZxzgaa+SrfaX2p2prNRg9e3d2/pqNihxJOaHN2rUYquiRxsCcHfRlEEdbPI4UNg3B0+qaYGSqwlPrkPGKrLvqcTMogbdJm1ubN46m6SUiAaSeknMYa/k3t5kwe3tU1d8hF18UTOsQnNj8y/mTMzyNpD/ceATgIQEAH+zVVyAAA4R9SLC6pOJ4BGd2+Ri6NRO1YHFUuUNOCnowplVd7xAoFxp4DF0sVRQl1hmPRO8v9QDIk7H9nNYiqyJjLqm29VLElcbUkx87NH0BqYMyRiwAc72ujXDRzVc+pq6STUqidxiEBjXE+fHBtu3KZjPpWPHYCjPP4KrUTWBFAtZ8XnxjbJTe5r5SyVe9VSSh2xkFKp8i+AFE8AmabRydHriL1KEslLsVGd1VtuyQMn9jobqkU7bOEMnFDCZgQM3bycG+e8kmKkLGwakpqshHw7qrmlxW1dXSNxVIwdggGwS5/FVQZbXHgUw4d1EbTmBXd7RLh4ZXdrHhsCfa7BrA8OMdIAcxTKsbAEf418dMyybconJYIqA8CvmuYzqw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3484
Original-Authentication-Results: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	88e882f7-45ab-4dcb-75fb-08d88bd19578
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ut81Yhc+CHHdFGNTW2iMTnt8cDS1rqp2VHg6RcccKbB5MBscJtjxrWnR3H5D70wtomM/RquSmTFQVIpfWSu91ybnqoFqUIo99XORRmen2dHNa3+qsPrDIwpu+VAnGYKNs51UoZ0TFLWJnRjiwWxyQnUePrv9Ue1D1pj32L0eR8UBsLjZNZTwUM5bZ16wpkrMiovEr9WvJNbbtclTcTaXJd40bLTI+jDpMsQvHAy6JpzsyUtSpeYO9NsMWCvtdn4DJqXjQAHc9o94YNntT1HJMF1VJo7RUN5OR3v+ust7JevkWhsETQ2y9mysBhKZSRj0aIKwzJflPZNZSycdI1TAa6sqj26mDYLBbVjOH7IpZX1ba4zw7CXC19QJ7ETLmUfthUsMYhtc7f9fM8a0AIjDG8ZXGYrYm5gjTSDEdXkTA8ZzOuzHtD/m7Q6T5QpdkNeHH5Y+RrNbZfGqQA5lCm8+ICN4ifY7aN+FY/eKFWos7DmDEydFFxOUBisAAvgEBHRl9X+Jw+9Rs+4+cTQupxPVzg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966005)(33656002)(5660300002)(6506007)(186003)(53546011)(966005)(316002)(54906003)(336012)(86362001)(9686003)(4326008)(26005)(82740400003)(70206006)(6862004)(70586007)(2906002)(8676002)(478600001)(47076004)(81166007)(55016002)(52536014)(8936002)(7696005)(82310400003)(356005)(83380400001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 14:52:42.2186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6e7c53-8004-4864-ada6-08d88bd19a12
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1955
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Jon,

________________________________________
From: Jon Mason <jdmason@kudzu.us>
Sent: Monday, November 16, 2020 7:55 PM
To: Khasim Mohammed
Cc: meta-arm@lists.yoctoproject.org; nd
Subject: Re: [meta-arm] [PATCH] arm-bsp/n1sdp: remove swap parition entry =
from wic image

On Thu, Nov 12, 2020 at 08:31:38PM +0530, Khasim Mohammed wrote:
> The swap partition on n1sdp seem to create an issue when shutdown or reb=
oot is run
> from the shell prompt, the console stops at "Deactivating swap ...". Hen=
ce
> removing the swap partition entry from wic image.
>
> Change-Id: I22cf971fdde7e3b8b386c74003983fab3d309cc5
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

> Applied to master.

Can you please apply this patch to gatesgarth branch as well ?

Thanks,
Jon

> ---
>  meta-arm-bsp/wic/n1sdp-efidisk.wks | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta-arm-bsp/wic/n1sdp-efidisk.wks b/meta-arm-bsp/wic/n1sdp=
-efidisk.wks
> index d1ebfb8..b131dd8 100644
> --- a/meta-arm-bsp/wic/n1sdp-efidisk.wks
> +++ b/meta-arm-bsp/wic/n1sdp-efidisk.wks
> @@ -6,6 +6,4 @@ part /boot --source bootimg-efi --sourceparams=3D"loader=
=
=3Dgrub-efi" --ondisk sda --
>
>  part / --source rootfs --ondisk sda --fstype=3Dext4 --label root --alig=
n 1024 --uuid=3D6a60524d-061d-454a-bfd1-38989910eccd
>
> -part swap --ondisk sda --size 44 --label swap1 --fstype=3Dswap
> -
>  bootloader --ptable gpt --configfile=3D"n1sdp-grub.cfg" --timeout=3D5
> --
> 2.17.1
>

>
>=20
>

