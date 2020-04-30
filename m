Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.87])
 by mx.groups.io with SMTP id smtpd.web10.8106.1588256767838077647
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 07:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=UpdiSuVQ;
 spf=pass (domain: arm.com, ip: 40.107.4.87, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1y+fb8kIr0Ft0qfQq64SnHvNHPdZnjze3U1xm7TGf8=;
 b=UpdiSuVQN8rc0KKJXspkfrhiy9fsLE3RSqk/IAnV9H1GIKY9P+7WTHguk5gCvGteht1mHdoneNfzR9zMEqDZ+1s5IucC7KWwHcNRJJPN0RwUNW15BCAGJ3fZ7/bxdnGSHM7hSnE/4DpT5S5plmgvvgOBmCm9PXvNOBkjvXvjr4s=
Received: from AM5PR0201CA0024.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::34) by VI1PR08MB2701.eurprd08.prod.outlook.com
 (2603:10a6:802:1a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Thu, 30 Apr
 2020 14:26:05 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::bf) by AM5PR0201CA0024.outlook.office365.com
 (2603:10a6:203:3d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend
 Transport; Thu, 30 Apr 2020 14:26:05 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 14:26:04 +0000
Received: ("Tessian outbound 11763d234d54:v54"); Thu, 30 Apr 2020 14:26:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9214a9bc5a286557
X-CR-MTA-TID: 64aa7808
Received: from e799face667a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E9155E8E-F4C8-4E6F-B89C-95E71AAAC8B5.1;
	Thu, 30 Apr 2020 14:25:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e799face667a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Apr 2020 14:25:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2bnxg4qTO+Iq9vfVOhtq8FadVBKNrvc/iupBHr6BBx7REe3T/vh3kOI6yCCNRAEVqqQ/PnwSIRr3Wya3sc4Zb0n1rm7tknLXqfymrI/E5obvZ4EYGmeLF4rSE7NOXf9oUcNWIMHEo7W2x5uoDxpeLKx+kuzn2vbSWpv5MR8YG0BsF0nJtnZl7HLAyypHTGGoZqfPjCLC69i/tmy+4ACdfx0XqFjW8bMbBWPzj5HxSGknOUmzJEntnZpY6nIjQde58ir/zpNj0LON4FOV39dsv5kY0UQJu/ytbI9m3ctfOrtFu3Tuc9JlkX3Vtp8h0ib+hwzGrg+Vw3qABaU3aHmUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1y+fb8kIr0Ft0qfQq64SnHvNHPdZnjze3U1xm7TGf8=;
 b=jRa3cmqWlQU/GvJnSsL/vFyMgAZyMpuZTwFajVmSxQH/F2BENX4nUCDE0wW9wYMNhttRTKrgqlBTwAg+tS40F25/YSScW/BB93h2/Hu9qd/mQRJMtx4ahohNbjIJWEaNDkH/Wl1ykBvpg5EgLwRD4a5ruvkmhhjpsI9alYjPpmo4ZjwCP3o4oy7znELJ21FLGB/1V3/LU+OSB6jFQqpf0HFkQ1jen872mdjhqwT0IXwrKJWzdYuRGMhJKm0QpDAqz3k3vO6nSJKQPqZrLmgQvlnWIz33A4P9Hpi0y02B97GEdVud+X8eCvXf/Eq7FfdwmUrGeEiodmdBCOZyuf4rqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1y+fb8kIr0Ft0qfQq64SnHvNHPdZnjze3U1xm7TGf8=;
 b=UpdiSuVQN8rc0KKJXspkfrhiy9fsLE3RSqk/IAnV9H1GIKY9P+7WTHguk5gCvGteht1mHdoneNfzR9zMEqDZ+1s5IucC7KWwHcNRJJPN0RwUNW15BCAGJ3fZ7/bxdnGSHM7hSnE/4DpT5S5plmgvvgOBmCm9PXvNOBkjvXvjr4s=
Received: from VI1PR08MB3693.eurprd08.prod.outlook.com (2603:10a6:803:ba::25)
 by VI1PR08MB3551.eurprd08.prod.outlook.com (2603:10a6:803:79::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 14:25:57 +0000
Received: from VI1PR08MB3693.eurprd08.prod.outlook.com
 ([fe80::c892:51a9:6c7f:3926]) by VI1PR08MB3693.eurprd08.prod.outlook.com
 ([fe80::c892:51a9:6c7f:3926%7]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 14:25:57 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] [arm-autonomy] xenguest-manager: Wait longer for /dev/xvdaX creation
Thread-Topic: [meta-arm] [PATCH] [arm-autonomy] xenguest-manager: Wait longer
 for /dev/xvdaX creation
Thread-Index: AQHWHvNv/l0ZEo48V0qMZWJ15C6f16iRuJ+A
Date: Thu, 30 Apr 2020 14:25:57 +0000
Message-ID: <D181AFAA-FF59-4CC9-935D-DDF6F8F2333C@arm.com>
References: <1588253373-58920-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1588253373-58920-1-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8d9985fb-9b91-4e4d-9a3a-08d7ed126a6b
x-ms-traffictypediagnostic: VI1PR08MB3551:|VI1PR08MB2701:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB2701C5D8A3751AF40A48731C9DAA0@VI1PR08MB2701.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;OLM:5236;
x-forefront-prvs: 0389EDA07F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 c9x0nft+mS9iGabLsClhwNK4HTweOLbf1RrQNaLSDpm0ttQRcxQfW6CMJnYpDvOXFQjBHCTOQlgETlTv7DNJkZ1ADrL50I8aHJE3lDlege1jO+2NG5zis9TjbVN7f2flMNXU4742vPkK5A+5jHGvknaK27kVy+77/8959eyuQKfcvedhfkjqUw9Hi/47makeMv41WXR/6yipu2ngXG9tfa7uH+PpByed8+E8Gb1tV8MhRatr/p/Y0Kh/kB5/8flOdNTdMkrRr/RhCsEhpxHQV7PVL8O+yBvjQjgRTrpnG7tCY4IAqCb/EeCEoscU5i7kkhZMgkB6DrXnbLa1/3bb0B7Ov/wQ9JbCLLyrFV6p4MTv0UKJrz9+sEYI/S3flFVteyuUZHRrTCqhTZmB1v6PImz4LdOskn72+tvi8zYJ5E+8zOUoA2To4BfdbunLAGTMWRRnbssqoO6SWPOJGYS7K3V5DoqlAfGhE+RHBA+8JMWkXz9o8Jg6pVuAc/2eA3K32dEa41sxHNPIG4LorDisQnEoG2oVdiYJP83arMTR2vImVWr1ek1+7jax0u0ee3lQ
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3693.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(66446008)(64756008)(66946007)(966005)(6512007)(2616005)(6486002)(8676002)(6916009)(478600001)(2906002)(5660300002)(71200400001)(76116006)(26005)(33656002)(316002)(186003)(66556008)(66476007)(8936002)(53546011)(6506007)(91956017)(4326008)(86362001)(36756003)(148743002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 QxNp1mDn/PAm7qoOev3T+W3CnVjznWhwgmte3bc4KJrsXcETxabE3252jJd9qLjVN6A740GCBG8KCvU8A1NB+geeFUpUW6n6pjvuYWENmlctsUP+5diPMAj7iIWAQ+0KEbiyFxiMZzYaZHuKLaDqhMdVFFrDa397PFzWw7dhIXFe9HyNmxlOo6sniM9jycYMkqjfEEQmNJVKqku5M7zriYvDnHStD+j3MPBcVv/VxryQbulBDgUih78FaY4uLERQRWbFINZk5ttCf7lYnQcwRCLov7U/ij7lakp3uY3c0Wc/6U1gh3jB5CKEL7bFS+DGUFN601+mwkKpcw1XaJRFZRk1u2gX/w8HU4R4dkWcewKaCifDClMWKTLDuM4iYA+Ttt620ior8UWkou9iS5jgn1ojlY8I54B3HA1209aBnQySFINjkGYISdytj5e+aroGN6yU6jeod6V7+ZIl99DEEfVGlGt51MCaZT1kd+NY0q2ZYVyJ8zhcXu8CJNDCNUy8+Ngv79VAxO4tys86c7sLj/3MH0P2sXVE5TTPxX3gPCXMgtTl6nazHeDh84jVW7/y+Zv9emxosJxzDLIep3WyfbN9JXoAF7gh196EeGRfFlYRCl6J6KXqyzQ/hz5wsUqwZ10f1wtqdx59zecm8TMclgyyE9vcsySDzUC2Qs8vzVpRz4ASFS+Ip3qBNblEUmOF+HgBA6h5R1slzwugz1L0jeF5Y7zL+9yrzBlc5jZ3m+sxKjpyAfdzmUlqR5Ufs9gC7yJih1UdbpYn6gVjBHAMzkFpLsGzTQdjPoyoVoorC7M=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3551
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(46966005)(81166007)(86362001)(47076004)(8676002)(6512007)(70206006)(82310400002)(356005)(70586007)(186003)(478600001)(2906002)(6486002)(36756003)(53546011)(33656002)(5660300002)(6506007)(4326008)(26005)(36906005)(336012)(966005)(316002)(82740400003)(6916009)(8936002)(2616005)(148743002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	63ee0142-63fc-4560-2aac-08d7ed126645
X-Forefront-PRVS: 0389EDA07F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hHN/e53Ydm+ZyCQ5GgdK/RnpZ6mSsxnpzOc6hnudGRIBsKa3FNBKAByHbBqEao/WRyP1dmqoQqKfQDt7bNMaCx5HzkMUgSS5/Jow6kAmfNkBgfX+CHZGsyjgfJI3VpKiXTqpYuz9fk1zzoyAV+QVLSOrsY1mOdOzXJiQDx0xTizVqcRe/IwTnMgXtugoj4dKmIstKwbikPkvdP7sRu4Cem1gogh9BYoIxSdjM6gJn6erxOs9Es33qG+i5YsSGJxbOStoViBN5AWJ+xfcip3jRljxY9wZhTGq/X4ylmOXXqpbL86DP/WeBPcc39+FofqeFk+rPNYfO2j7KRPpW9LHlHn5AdEsc6RSofhzq3n2Nd0K0XVKwTuAWv4alR7fvMQX+j31/856vckVirxkjlNAInp2x9EPfm3vfISkeRkn8NcZ1YAVa331Q33ssUJDBwjk7j3aHWFT3WUm5/9g/6jRtcOZg8gj21hvWD/v+KZO/JeGDLxn5RScUKHn+FFtAak1EPmB8oBf6nLBEfD7xy/sot1CNF8G3QuHf/HBCGve16/+9e2d4TsYK1o1STQm2W0ATYpW8VW4sfRY8nia3uMvl9YoTzWB7PLrR8MV8VYWAer5lm0dvsrCWmB+rX0ZWGW6
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 14:26:04.5756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9985fb-9b91-4e4d-9a3a-08d7ed126a6b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2701
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <25B09F5F9C5CC74EA396E75E3EA99F5E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 30 Apr 2020, at 14:29, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> Implement a wait block of 20s with exit condition for checking
> /dev/xvdaX creation.
> For example, in cases where the rootfs is mounted via NFS, a longer
> time is needed until the xvda device appears in the system.
>=20
> Change-Id: I44cbcf2a43aeb476eae92d5b6d2cfd683e4bdf21
> Issue-Id: SCM-929
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> .../recipes-extended/xenguest/files/xenguest-manager      | 15 +++++++++=
++----
> 1 file changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-=
manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manage=
r
> index b25eeb5..4777054 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> @@ -234,10 +234,17 @@ function xenguest_disk_init()
>                 exit 1
>             fi
>=20
> -            # Sometimes it takes time to see the device
> -            if [ ! -b /dev/xvda${part} ]; then
> -                sleep 1
> -            fi
> +
> +            # Loop for 20s to wait until /dev/xvdaX appears
> +            i=3D0
> +            while [ ! -b /dev/xvda${part} ]; do
> +                ((i++))
> +                if [[ "$i" =3D=3D '40' ]]; then
> +                    break;
> +                fi
> +                sleep 0.5
> +            done
> +
>             if [ ! -b /dev/xvda${part} ]; then
>                 echo "${PREF} Partition ${part} creation error"
>                 xenguest_detach_disk
> --=20
> 2.7.4
>=20
>=20

