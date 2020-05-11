Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.41])
 by mx.groups.io with SMTP id smtpd.web10.12040.1589204171721120481
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 06:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dwbtaBPv;
 spf=pass (domain: arm.com, ip: 40.107.20.41, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCeZc8q4LgJpG/euXGHM79YCRTyK4l8JWI/v9/Jwwvc=;
 b=dwbtaBPvPnmTbJTYL6PK7Damj3V5p867xvN5bhWd0ty/Q+YTFaimImgb5d7A32okUHV+jtTdtykSPUIJbyyUDBFUaX15dlKZ1IBI2Nx7M6fEjsSdt7uHFwPWpGWBUa8ognjtSvhvmnP4OleZq+VMEKil/smb42Ys3dkv5T+M6tA=
Received: from AM5PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:206:1::29)
 by AM6PR08MB3816.eurprd08.prod.outlook.com (2603:10a6:20b:8c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Mon, 11 May
 2020 13:36:09 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::94) by AM5PR04CA0016.outlook.office365.com
 (2603:10a6:206:1::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend
 Transport; Mon, 11 May 2020 13:36:09 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Mon, 11 May 2020 13:36:08 +0000
Received: ("Tessian outbound 4cdf5642225a:v54"); Mon, 11 May 2020 13:36:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b0e7f789fe2a2160
X-CR-MTA-TID: 64aa7808
Received: from 705b14fd3653.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8E01811D-310B-43CD-8CC9-EBCEF7108E48.1;
	Mon, 11 May 2020 13:36:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 705b14fd3653.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 11 May 2020 13:36:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxoPuWORpv3Rx2AxjuYCOAsl+nYPB700ThQltVLKGsbHgK0/6HY+AhADHOK+NGKIi3jIE/VQUeMBqUTr9hLofiRIN1F9YU8pbV+vtjKCjjg8g5BMReAxL5nuz8LW1EkO5Jl/hY08sKpg8t7i687mA5Px6fO8wSUD+6RUBZUw/3pwXbRLz1sTMawDWAYocO0lI43TYd+F2FbLckBWQOWzueJsGspnCj+rD3mqohCQq5T2cYxxJNm7P51P82lWvvHL3Ehz+KMfaYJzHgSXC+39AkDZveHNHYMNK6AyzDKAk4bwQtyU6hGmIX8snQvuScy73hTl+kga7uCw2XrugU6Dkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCeZc8q4LgJpG/euXGHM79YCRTyK4l8JWI/v9/Jwwvc=;
 b=VXfuwkxSPfModQ0BX5cAfVWC56pbhT1/Hk3f8ZFJbxIuX4nLLlzHqKdjmHSDDucuLaeSiZf3aZSyCFyZu/ln3F3ATFztDfYXsWeootFpq+tB+6p2ssu8AJuFF2H80M9v9ASzJ6jhwDmmK8jjMHwaNuSQ4c2sYWO3YG4cow6F9htOKU6kwjpM55bV1vrCqikSep5L1YeVXaeY/kWTgZO3+oqvJfmGzIQE8QpzXcC9ljqfw722y115thbq7+t6JlsCD3i7svS3xYoD79/gXRHBnHHcCDiYroDKwneSSK9/ys1/nP5DCQjoSlRnoPtDMDz2Hd881gsWroxoqg2ee6uimQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCeZc8q4LgJpG/euXGHM79YCRTyK4l8JWI/v9/Jwwvc=;
 b=dwbtaBPvPnmTbJTYL6PK7Damj3V5p867xvN5bhWd0ty/Q+YTFaimImgb5d7A32okUHV+jtTdtykSPUIJbyyUDBFUaX15dlKZ1IBI2Nx7M6fEjsSdt7uHFwPWpGWBUa8ognjtSvhvmnP4OleZq+VMEKil/smb42Ys3dkv5T+M6tA=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3386.eurprd08.prod.outlook.com (2603:10a6:10:46::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Mon, 11 May
 2020 13:36:02 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2979.033; Mon, 11 May 2020
 13:36:02 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy: xenguest-mgr: Add support for compressed partition images
Thread-Topic: [meta-arm] [PATCH] arm-autonomy: xenguest-mgr: Add support for
 compressed partition images
Thread-Index: AQHWJ5hBFAUelP004UST8tKbRxPvZqii4wkA
Date: Mon, 11 May 2020 13:36:02 +0000
Message-ID: <5A53E84C-1FB1-4FC5-BE64-0E1CA37285C5@arm.com>
References: <1589203766-65846-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1589203766-65846-1-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 98f80d00-b878-4569-4b93-08d7f5b04363
x-ms-traffictypediagnostic: DB7PR08MB3386:|AM6PR08MB3816:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3816F4D59FDF172E561411FF9DA10@AM6PR08MB3816.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 04004D94E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 BK90eKa9loGpq1rSUuRbNwenh9szPOQmczW6vzJaJGf/oXARQDHnEYoQgesWKaNQAuLCE51mdBqcVlqGpENldUYrMxa+WySv4Ljsx+jM4hRId4ySDBgF6yQn98EtU4Jg+WddgC9DzRJGHdJzt6D7Q+abzAfvaIbVM+cQ5K3piZCBIhhQcdmpky6WCYh+oic9Wjst5/VZkR+xrschsfH38kicQsilXNUrUNXIOuzEAU692088n0h7jhiZ96YnHlFWxfl08brM5dRsPPgBdxZzo863K5n/QR2B8y0SGVCXZDKgWzDcf5Vde0U+lejFbI90RLtpmHVIKX+BT9IJa1rv6eAj8BqoA9/wBzxkuJkIOvIdFUH54QolfB9nQ7Tl0NP17s60Chs0Or5wbqf3xgWPayT93UyRoMkMJPMgeZMwJzvFw2jUQyLemlMCZI4YQkeUoqm9dVjnPDj954GOUcffwCGUP/VsvEfvNXRqkrMU09SePmj7czqy886qtUp/nQvODEfFQByDNW0uUW0mOkuXLZ6qjkjJdMqT9UqGx2pRKiMWG7WDA7X8kQJ4TWWYXBPyjnDKCKipkTO3eb+KlQhsfqMy66KquZA9nron8vBQSF0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(33430700001)(6506007)(53546011)(8676002)(26005)(8936002)(4326008)(66476007)(86362001)(6916009)(66946007)(2616005)(91956017)(76116006)(36756003)(5660300002)(966005)(71200400001)(64756008)(186003)(316002)(66556008)(33656002)(66446008)(33440700001)(2906002)(6512007)(478600001)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 GBEXtcb7dz8ll/BeMjwqij/+NuvJT1f06Jwe4tA8Ny6YX/SPsDL8W+j7+Doh369ephqxNFm8fdaUgtJah13AIF3M0R83RKn2i1HcPqUipzs1jt5k5ti73/68NLvEQOVAjFyzOuSghqSclT6NzTgSQrp8mRMVwsuwMusvTlnXMhYhQvl7/Po4WH8KrAnsWWH47H3XIHKH9lFLwvqrlbsECMlIZ49sqOq+JYWGX2RArrM3VFqH78KZMwvpunmejZlX/1KhHqUX3T82Ozs43hlaPC1OkgOcrjKb2kwj4vYUhJCUeY+AHKiUYHlM4HS2mSYw8gdNrBUAyZZRde+jpwWl3KAfWp/6AvCA2N6g7pREhUqD/AUJCjQKDnxbci1THZZuiyjQmSyrMtFr5v/MH4mIkEL5ZpHzdv1jOHpu3WbZh+h4H3VTOn5YDsBvhzhWu+Pk850EWJDxvhksuVLKRn3FwKLJQYwz8DuTgujJY3XM19k=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3386
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(46966005)(33430700001)(6916009)(70206006)(47076004)(316002)(336012)(26005)(36906005)(6506007)(8936002)(33440700001)(6512007)(4326008)(2906002)(36756003)(186003)(53546011)(356005)(5660300002)(6486002)(478600001)(966005)(33656002)(70586007)(86362001)(8676002)(82740400003)(82310400002)(2616005)(81166007);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c5316155-e614-4b37-60e6-08d7f5b03fa7
X-Forefront-PRVS: 04004D94E2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G/5VM5BLWMG7bjb7XFkUfXGtFxwCsPbsYjFc5CbQJOzB0m9p7k+F8GbuB0egIWFDs2RPocMvYRzIJnrvH0Y9Hw+yFulSiJMVobIavBN4aoDulk6NgY9lMAVVSR/4oXr5oRDEgn+HkQuLHs84Q3QEnfLSvRWjdgtnMcwkW8mH9hY5P7EmUhSRJdMKcXfZwvBRlhFCiE4tEtorLAkglmlUYIOeJg5yYRHBqWGgcSLPG9Ar7/CobGBa7OVV2Zwr8RJSg4d/KkH0JPlDEbx9o+SPO2jeBzGa9Mmi+C7BKN9J6crv4/rQjJOrzI4kg/K543cr7rE6jNL7HUE/cxCjpkRHFydcSXwKGBOxacl4D6mYEA6qIQ+gVHEwd8CUl73ApBKUmLZ1dZIneECtrvkomMTejfXBB8+oV1UXA2QofZPEjnMMnl+Zd63NjutyouGsqW4jGv1v6FIf8TGi1JfsILkylZ1MQKgzRnVgAdKL7M4uaXmJzF+eZ5c915GmCEZBnS8o5veSBtJxdA7gXGMSvbGg3/Rq/n4M+VEcgD725drqjBlXR0ZKQxHddJByBUlcFmIiF7EOQUcf5hGUzL3UL2ZcdMsZeP6zCjxZZOuGSYlirRriJhkK9XxyzrFSIqW9COvSurxUlOd3qvl9KMk2soiQEw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2020 13:36:08.9264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f80d00-b878-4569-4b93-08d7f5b04363
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3816
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <87974EF9E613724B81BA70D2D7A19691@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 11 May 2020, at 14:29, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> From: Kamil Dziezyk <kamil.dziezyk@arm.com>
>=20
> xenguest-manager now can create guest partition
> using compressed images like *.img.gz or *.img.bz2.
>=20
> Change-Id: Ifaec0b7c301b2b316ebccdd0ca85083262f2714c
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> .../documentation/xenguest-mkimage.md              |  2 +-
> .../xenguest/files/xenguest-manager                | 24 ++++++++++++++++=
+++---
> 2 files changed, 22 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-arm-autonomy/documentation/xenguest-mkimage.md b/meta-=
arm-autonomy/documentation/xenguest-mkimage.md
> index d77fd48..3dcc28b 100644
> --- a/meta-arm-autonomy/documentation/xenguest-mkimage.md
> +++ b/meta-arm-autonomy/documentation/xenguest-mkimage.md
> @@ -62,7 +62,7 @@ The file contains the following entries:
> - `DISK_PARTX=3DSIZE:FS:CONTENT`: create a partition number X (1 to 4) w=
ith a
>   size of SIZE GB, format it with filesystem FS (can be ext2, ext3, ext4=
, vfat
>   or swap) and extract CONTENT as initial partition content
> -  (.tar[.gz|.xz|.bz2] file or img file to be dumped in the partition). =
FS and
> +  (.tar[.gz|.xz|.bz2] file or img[.gz|.bz2] file to be dumped in the pa=
rtition). FS and
>   CONTENT can be empty.
>=20
> The disk-files contain files to be used for initializing the disk partit=
ions
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-=
manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manage=
r
> index 4777054..99975a2 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> @@ -262,12 +262,30 @@ function xenguest_disk_init()
>             fi
>=20
>             case ${content} in
> -                *.img)
> +                *.img*)
> +                    decompress=3D""
> +                    case ${content} in
> +                        *.img.gz)
> +                            decompress=3D'zcat'
> +                            ;;
> +                        *.img.bz2)
> +                            decompress=3D'bzcat'
> +                            ;;
> +                        *.img)
> +                            decompress=3D'cat'
> +                            ;;
> +                        *)
> +                            # invalid/unknown compression type
> +                            echo "${PREF} Invalid file format in disk $=
{content}"
> +                            xenguest_detach_disk
> +                            exit 1
> +                            ;;
> +                    esac
>                     # dd into partition
>                     echo "xenguest-mkimage extract-disk-file ${guestfile=
} " \
> -                        "${content} | dd of=3D/dev/xvda${part} " >> ${L=
OGFILE} 2>&1
> +                        "${content} | ${decompress} | dd of=3D/dev/xvda=
${part} " >> ${LOGFILE} 2>&1
>                     xenguest-mkimage extract-disk-file ${guestfile} ${co=
ntent} \
> -                        | dd of=3D/dev/xvda${part} >> ${LOGFILE} 2>&1
> +                        | ${decompress} | dd of=3D/dev/xvda${part} >> $=
{LOGFILE} 2>&1
>                     if [ $? -ne 0 ]; then
>                         echo "${PREF} Cannot populate partition ${part}"
>                         xenguest_detach_disk
> --=20
> 2.7.4
>=20
>=20

