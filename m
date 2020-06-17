Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.75])
 by mx.groups.io with SMTP id smtpd.web12.2774.1592381041696406029
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 01:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=IOxM1QYP;
 spf=pass (domain: arm.com, ip: 40.107.22.75, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwC85loz1MqYBZXlVsLCZvLzGByOzfMpS1aVU/GPVZM=;
 b=IOxM1QYPfJ1eZsuM5N3dWXcMtS/Zl5CuOFSM5ECJ19p2wVI/g79/+1IQa91nYd/zixJ1gDBgnSJoCZvO3pVuhov4wfsBkNRhyUILsOe1/rlfHUI6c6Y6nMA37toPCCsape00p3ojJ4XS5qfdPoCjYrvjhv4/m3c0DTy/ski+JiY=
Received: from DB6P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::15) by
 VI1PR08MB5312.eurprd08.prod.outlook.com (2603:10a6:803:139::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19; Wed, 17 Jun
 2020 08:03:59 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::c4) by DB6P191CA0005.outlook.office365.com
 (2603:10a6:6:28::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Wed, 17 Jun 2020 08:03:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 08:03:58 +0000
Received: ("Tessian outbound 13f833fb3c6d:v59"); Wed, 17 Jun 2020 08:03:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 23f5d71ccd9dfc73
X-CR-MTA-TID: 64aa7808
Received: from c5e75a78c95a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 42BDE95B-ADE4-485D-BEDA-0E2ABB5301C4.1;
	Wed, 17 Jun 2020 08:03:53 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c5e75a78c95a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 17 Jun 2020 08:03:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QD/IwtXYMLRRl+g76camhyMV77vViMWvOLx8eGXDpiFNIDmI+GAJC1NjO3QS+Ob+gLvkJxrws9reFsGIGatGI0DLGmL3nJoEkt035rKZYlIhW7pgaSXntu46yU0eKAV6nauvSIcvsRbcTPDQcqxVq0EiZo1zX0drrungzIJ+YhKFG67dbKErWjftesx8Pxkbriw51I2lMXUHDWF1tw4U7zGcCCJTC0yvxeDRgkDsiAHrUBYM/tyiy4q4xaTFuTDgKayFAmRroKvEBje6dAgKuo7Y92W+biCH7LvcWPWBc3jZ1vXB+lslMo+p8GVXNdGtkMgkjaS8qY8FD55LjPq3Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwC85loz1MqYBZXlVsLCZvLzGByOzfMpS1aVU/GPVZM=;
 b=I6AAG1b+xQnhu8UDPzYlG79VcKVeW3Tu8FtHJk6TJgHYgV6BubrGjzS9zAya/hISuKrxhK9VVr0JnK5Yt42PTtSP/0rlIjowTTiSnb9RIb71BUyLhac7whBzkznxZ45RoTHs8mEM+n02aEkAANfpPqFDFKDlt3cXtCrzERa2yqBe7+VVwOo03/MRFKBgPIXVTGW3pi7eslZW98/frKz9CWWSn0PLVgXRoohhh4mcQL+vSs7uzTHte0d4jx/pLZPcQ+6CVLRGsSDj3qt3S97MVaLAE6gFQZ+4W59pnZzgEv2qbEUS68PKZSPShQXv7d38oHzOFG04XR1VeX9uxtpNww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwC85loz1MqYBZXlVsLCZvLzGByOzfMpS1aVU/GPVZM=;
 b=IOxM1QYPfJ1eZsuM5N3dWXcMtS/Zl5CuOFSM5ECJ19p2wVI/g79/+1IQa91nYd/zixJ1gDBgnSJoCZvO3pVuhov4wfsBkNRhyUILsOe1/rlfHUI6c6Y6nMA37toPCCsape00p3ojJ4XS5qfdPoCjYrvjhv4/m3c0DTy/ski+JiY=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3916.eurprd08.prod.outlook.com (2603:10a6:10:7e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Wed, 17 Jun
 2020 08:03:51 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.028; Wed, 17 Jun 2020
 08:03:51 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH 2/2] arm-autonomy, xenguest-manager: Guest creation failure cleanup
Thread-Topic: [meta-arm] [PATCH 2/2] arm-autonomy, xenguest-manager: Guest
 creation failure cleanup
Thread-Index: AQHWRG0BWXYownPOUky976zmwZUzMajcctKA
Date: Wed, 17 Jun 2020 08:03:51 +0000
Message-ID: <CFB739C2-B626-49C2-97F9-FB6222AFA481@arm.com>
References: <1592373744-85392-1-git-send-email-diego.sueiro@arm.com>
 <1592373744-85392-2-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1592373744-85392-2-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2b9de023-0467-464e-998b-08d81294fd6d
x-ms-traffictypediagnostic: DB7PR08MB3916:|VI1PR08MB5312:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB53120D1F57A54F6166664B1B9D9A0@VI1PR08MB5312.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /qf1WxtNOBuSLSQn+/rAhjpB3BJ/pGX1wEVTHY7oDUSQMwrLa1v8WvzcVCT8PrV7PeYQzC9afqGwNvBpRh79efT+Xa1P62Isn0+t3ERFYBKhNQN/eJ/3tDgOtu4DMjbDAF/LkpSEdeUMY0bGGUOdolcONho5QHq9YS1bHl255HlRxDQsHczecJUKUfWswX/jfhgVo6j59NWyHYRccW09mrl0du4yezh5Dnfro2AcIaNsV6C2eJUxHe5aiS4LoWmVUnFWZ6AuSmhkSCMVYkOLDko4EHsRIoVioOFpMuuqlosLz16R0I+Bc6pECW+o9tdRkdVNE8sgZpQRyheUZ2ICFf0QM9a63wKEm0+++73+ZlHBhc4SvdxTG0vk5ZZWWtpD1GRYLq4hoeW6tk41m5qgkw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(36756003)(76116006)(83380400001)(91956017)(186003)(86362001)(66946007)(6506007)(53546011)(2616005)(30864003)(26005)(6636002)(8676002)(6862004)(54906003)(8936002)(478600001)(6512007)(966005)(6486002)(66476007)(2906002)(4326008)(33656002)(5660300002)(71200400001)(64756008)(66446008)(316002)(66556008)(37006003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 WAvMjIlr+Lx6Ug1D9Emz9fcmxvjvAabq3AX24IHQN8EPWeE98tIdiO6NAsBtAffe/SpbnjHB6ehSuRhuRpVBYVkL1Oy7MLIgY69Ya3vjqZT9V1exyXrIriRpHuepGEjmUik3MV2Od4nZlcp2FxKo40z681CCu7Tjj9mcUjCyK7jo8qAqdCxNlDrDY9+PLNqePRwJb45obOWzM5f0sTA9Vpro4LPv9ubkT6vcGgjkgia04xEoErFNu5UnqTt2vxNi/WzQegUkTpZWi3tpQNxPPn2GpK2urz4xRVvPMlYQIriX+u48HyGJBRBcoyzwYP9MghFRgIco7dkZf2+y+RZnBSb7tIqYB8ufp214xZAY2DBLWCeYr4lZGCHaH4zCuqFDTpvDCZ4sCdoypZu7MH/2/udYiYySMYmVVk6rlTLMSn8Cx8lCbTNj1D1dW6n51nEIlRCCKcI3fmPu4x/lJMMp+PBR6GYsT5icWIxq4Jek7545Ux78uBrEsdDokP4MfdjX
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3916
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966005)(70586007)(2616005)(6512007)(53546011)(4326008)(6636002)(70206006)(966005)(316002)(6506007)(47076004)(5660300002)(186003)(336012)(26005)(8676002)(30864003)(33656002)(36756003)(37006003)(8936002)(2906002)(54906003)(82310400002)(82740400003)(81166007)(86362001)(356005)(6862004)(83380400001)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6ea389a9-f2eb-4879-6964-08d81294f940
X-Forefront-PRVS: 04371797A5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nUqC4WM0ExYOWSddqg/YGgct3D6l4l6YAZoIaQc7GfPnrcU7MvFGHas2WVit7Up//vycaRrvEnwJJZYZjR7fjUYm7oPp7oekuhcx5pi3lXDJab3QQS4BqzgosVe+saPX4AR0oLnb8mJi1bIrU/FkEGnq4Ab3DMzVDpioPY+74mYGVojIO4u9Yu6vK6IJk7RwxCS5qrcpNokSWg5uSxkRIyaISrCYeOuc0f/QW7ucbbTFLbqbXQFwZ1fP/TBXj7iitvS90U3Mm3Zqsrg0/XqMeFvb43VHKT8U76Fa0DOLq5Mh1KvWEWH3Lf3EjFDCoG+LgWWfXisl4hPZFgip3FZvwqPlxk0ntTB420qdMNQAipmmIMSxZL9U3LbMqnRD4Rf54kK3ouNZIKCI7HyN7lUjXLZnanmp/IZkDqjqhi2zilldi/GI5d98ESCZtnWEXgw7avi051sC5jpBRtxcH5RD9YyyXYsZmtVmKBRIHwsw/1Q=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 08:03:58.9023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9de023-0467-464e-998b-08d81294fd6d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5312
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CBB28B01C5DC6B42951E1DD96DD9BECC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 17 Jun 2020, at 07:02, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> When the guest creation process fails, we need to perform a proper
> cleanup on the system, like removing configuration files and detaching
> the disk previously attached to Xen.
>=20
> This patch also adds an extra failure condition when the partition
> assigned to guests is already formatted with a filesystem and it is not
> a lvm partition.
>=20
> Change-Id: I36087bf95fb8ff093160a6df406920fa5f293e09
> Issue-Id: SCM-996
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> .../xenguest/files/xenguest-manager                | 114 ++++++++++++++-=
------
> .../recipes-extended/xenguest/xenguest-manager.bb  |   2 +-
> 2 files changed, 79 insertions(+), 37 deletions(-)
>=20
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-=
manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manage=
r
> index 6a10d35..d55c9ff 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> @@ -56,10 +56,14 @@ EOF
>=20
> function xenguest_volume_init()
> {
> +    # Return:
> +    # 0 - success
> +    # 1 - failure
> +
>     if [ -z "${XENGUEST_VOLUME_DEVICE:-}" -o \
>         ! -b ${XENGUEST_VOLUME_DEVICE:-} ]; then
>         echo "${PREF} Invalid volume device in configuration: ${XENGUEST=
_VOLUME_DEVICE:-}"
> -        exit 1
> +        return 1
>     fi
>=20
>     if [ -z "${XENGUEST_VOLUME_NAME:-}" ]; then
> @@ -69,14 +73,26 @@ function xenguest_volume_init()
>=20
>     pvs ${XENGUEST_VOLUME_DEVICE} > /dev/null 2>&1
>     if [ $? -ne 0 ]; then
> -        echo "${PREF} Initialize lvm on ${XENGUEST_VOLUME_DEVICE}"
> -        echo "pvcreate -f ${XENGUEST_VOLUME_DEVICE}" >> ${LOGFILE} 2>&1
> -        pvcreate -f ${XENGUEST_VOLUME_DEVICE} >> ${LOGFILE} 2>&1
> -        if [ $? -ne 0 ]; then
> -            echo "${PREF} Error"
> -            exit 1
> +        # Check if there is no filesystem in the block device
> +        echo "lsblk -n -o FSTYPE ${XENGUEST_VOLUME_DEVICE}" >> ${LOGFIL=
E} 2>&1
> +        filesystem=3D$(lsblk -n -o FSTYPE ${XENGUEST_VOLUME_DEVICE} 2>>=
 ${LOGFILE})
> +        if [[ $? -eq 0 && -z "$filesystem" ]]; then
> +            echo "${PREF} Initialize lvm on ${XENGUEST_VOLUME_DEVICE}"
> +            echo "pvcreate -f ${XENGUEST_VOLUME_DEVICE}" >> ${LOGFILE} =
2>&1
> +            pvcreate -f ${XENGUEST_VOLUME_DEVICE} >> ${LOGFILE} 2>&1
> +            if [ $? -ne 0 ]; then
> +                echo "${PREF} Error: initialing lvm on " \
> +                     "${XENGUEST_VOLUME_DEVICE} failed." | tee -a ${LOG=
FILE}
> +                return 1
> +            fi
> +        else
> +            [ -z "$filesystem" ] || \
> +                echo "${PREF} Error: The ${XENGUEST_VOLUME_DEVICE} is a=
lready " \
> +                     "formatted as $filesystem." | tee -a ${LOGFILE}
> +            return 1
>         fi
>     fi
> +
>     vgs ${XENGUEST_VOLUME_NAME} > /dev/null 2>&1
>     if [ $? -ne 0 ]; then
>         echo "${PREF} Create ${XENGUEST_VOLUME_NAME} volume"
> @@ -85,10 +101,13 @@ function xenguest_volume_init()
>         vgcreate ${XENGUEST_VOLUME_NAME} ${XENGUEST_VOLUME_DEVICE} \
>>> ${LOGFILE} 2>&1
>         if [ $? -ne 0 ]; then
> -            echo "${PREF} Error"
> -            exit 1
> +            echo "${PREF} Error: creating ${XENGUEST_VOLUME_NAME} volum=
e " \
> +                 "failed."  | tee -a ${LOGFILE}
> +            return 1
>         fi
>     fi
> +
> +    return 0
> }
>=20
> # Detach a disk we attached to xen
> @@ -102,12 +121,21 @@ function xenguest_detach_disk()
>>> ${LOGFILE} 2>&1
>     if [ $? -ne 0 ]; then
>         echo "${PREF} Error detaching partition ${part}"
> -        exit 1
> +        return 1
>     fi
> }
>=20
> function xenguest_disk_init()
> {
> +    # Inputs:
> +    # $1 - guestname
> +    # $2 - guestfile
> +    #
> +    # Outputs:
> +    # 0 - success
> +    # 1 - failed at guest disk preparation
> +    # 2 - failed at guest disk creation
> +
>     guestname=3D"$1"
>     guestfile=3D"$2"
>     devname=3D"/dev/${XENGUEST_VOLUME_NAME}/${guestname}"
> @@ -119,12 +147,16 @@ function xenguest_disk_init()
>         return
>     fi
>=20
> -    echo "${PREF} Create ${guestname} disk"
> +    echo "${PREF} Create ${guestname} disk."
>=20
>     # Init our volume
> -    xenguest_volume_init
> +    xenguest_volume_init ${guestname}
> +    if [ $? -ne 0 ]; then
> +        return 1
> +    fi
>=20
> -    echo "${PREF} Create hard drive for ${guestname}"
> +    echo "${PREF} Create hard drive for ${guestname}." \
> +         "This might take a while..."
>=20
>=20
>     # Remove volume if it already exist
> @@ -135,7 +167,7 @@ function xenguest_disk_init()
>         lvremove -y ${devname} >> ${LOGFILE} 2>&1
>         if [ $? -ne 0 ]; then
>             echo "${PREF} Error removing volume ${guestname}"
> -            exit 1
> +            return 1
>         fi
>     fi
>=20
> @@ -146,7 +178,7 @@ function xenguest_disk_init()
>>> ${LOGFILE} 2>&1
>     if [ $? -ne 0 ]; then
>         echo "${PREF} Error creating volume ${guestname}"
> -        exit 1
> +        return 1
>     fi
>=20
>     # Add partition table
> @@ -154,7 +186,7 @@ function xenguest_disk_init()
>     parted -s ${devname} mklabel msdos >> ${LOGFILE} 2>&1
>     if [ $? -ne 0 ]; then
>         echo "${PREF} Error creating partition table on ${guestname}"
> -        exit 1
> +        return 1
>     fi
>=20
>     # Setup disk name in xen configuration
> @@ -164,7 +196,7 @@ function xenguest_disk_init()
>         --xen-disk=3D${devname} >> ${LOGFILE} 2>&1
>     if [ $? -ne 0 ]; then
>         echo "${PREF} Error setting disk in xen configuration"
> -        exit 1
> +        return 1
>     fi
>=20
>     # Create partitions
> @@ -197,7 +229,7 @@ function xenguest_disk_init()
>                 ${partend} >> ${LOGFILE} 2>&1
>             if [ $? -ne 0 ]; then
>                 echo "${PREF} Error adding partition ${part}"
> -                exit 1
> +                return 1
>             fi
>=20
>             # Set next partition start to current partition end
> @@ -219,7 +251,7 @@ function xenguest_disk_init()
>                     *)
>                         echo "${PREF} partition ${part} of ${guestname}"=
 \
>                             "fstype is invalid: ${fstype}"
> -                        exit 1
> +                        return 1
>                         ;;
>                 esac
>             else
> @@ -231,7 +263,7 @@ function xenguest_disk_init()
>             xl block-attach 0 phy:${devname} xvda w >> ${LOGFILE} 2>&1
>             if [ $? -ne 0 ]; then
>                 echo "${PREF} Error attaching partition ${part}"
> -                exit 1
> +                return 1
>             fi
>=20
>=20
> @@ -247,8 +279,7 @@ function xenguest_disk_init()
>=20
>             if [ ! -b /dev/xvda${part} ]; then
>                 echo "${PREF} Partition ${part} creation error"
> -                xenguest_detach_disk
> -                exit 1
> +                return 2
>             fi
>=20
>             if [ -n "${formatcmd}" ]; then
> @@ -256,8 +287,7 @@ function xenguest_disk_init()
>                 ${formatcmd} /dev/xvda${part}
>                 if [ $? -ne 0 ]; then
>                     echo "${PREF} Cannot create partition ${part} FS"
> -                    xenguest_detach_disk
> -                    exit 1
> +                    return 2
>                 fi
>             fi
>=20
> @@ -277,8 +307,7 @@ function xenguest_disk_init()
>                         *)
>                             # invalid/unknown compression type
>                             echo "${PREF} Invalid file format in disk ${=
content}"
> -                            xenguest_detach_disk
> -                            exit 1
> +                            return 2
>                             ;;
>                     esac
>                     # dd into partition
> @@ -288,8 +317,7 @@ function xenguest_disk_init()
>                         | ${decompress} | dd of=3D/dev/xvda${part} >> ${=
LOGFILE} 2>&1
>                     if [ $? -ne 0 ]; then
>                         echo "${PREF} Cannot populate partition ${part}"
> -                        xenguest_detach_disk
> -                        exit 1
> +                        return 2
>                     fi
>                     ;;
>                 *.tar*)
> @@ -310,8 +338,7 @@ function xenguest_disk_init()
>                         *)
>                             # invalid/unknown tar type
>                             echo "${PREF} Invalid file format in disk ${=
content}"
> -                            xenguest_detach_disk
> -                            exit 1
> +                            return 2
>                             ;;
>                     esac
>=20
> @@ -321,9 +348,8 @@ function xenguest_disk_init()
>                     mount /dev/xvda${part} ${mntdir} >> ${LOGFILE} 2>&1
>                     if [ $? -ne 0 ]; then
>                         echo "${PREF} Cannot mount partition ${part}"
> -                        xenguest_detach_disk
>                         rm -rf ${mntdir}
> -                        exit 1
> +                        return 2
>                     fi
>=20
>                     # tar and unmount
> @@ -336,16 +362,14 @@ function xenguest_disk_init()
>                         echo "${PREF} Cannot populate partition ${part}"
>                         umount ${mntdir}
>                         rm -rf ${mntdir}
> -                        xenguest_detach_disk
> -                        exit 1
> +                        return 2
>                     fi
>                     echo "umount ${mntdir}" >> ${LOGFILE} 2>&1
>                     umount ${mntdir} >> ${LOGFILE} 2>&1
>                     if [ $? -ne 0 ]; then
>                         echo "${PREF} Error unmounting ${part}"
> -                        xenguest_detach_disk
>                         rm -rf ${mntdir}
> -                        exit 1
> +                        return 2
>                     fi
>                     rm -rf ${mntdir}
>                     ;;
> @@ -356,6 +380,9 @@ function xenguest_disk_init()
>=20
>             # Detach disk
>             xenguest_detach_disk
> +            if [ $? -ne 0 ]; then
> +                return 1
> +            fi
>         fi
>     done
>=20
> @@ -392,10 +419,21 @@ function xenguest_guest_create()
>         --xen-name=3D${guestname} >> ${LOGFILE} 2>&1
>     if [ $? -ne 0 ]; then
>         echo "${PREF} Error setting guest name"
> +        xenguest_guest_remove ${guestname}
>         exit 1
>     fi
>=20
>     xenguest_disk_init ${guestname} ${guestfile}
> +    disk_init_status=3D$?
> +    if [ $disk_init_status -ne 0 ]; then
> +        echo "${PREF} Error: ${guestname} disk creation failed."
> +        if [ $disk_init_status -eq 2 ]; then
> +            xenguest_detach_disk
> +        fi
> +        xenguest_guest_remove ${guestname}
> +        exit 1
> +    fi
> +
> }
>=20
> function xenguest_guest_remove()
> @@ -408,6 +446,7 @@ function xenguest_guest_remove()
>     lvs ${XENGUEST_VOLUME_NAME}/${guestname} >> ${LOGFILE} 2>&1
>     if [ $? -eq 0 ]; then
>         # Remove guest volume
> +        echo "${PREF} Removing ${guestname} volume. This might take a w=
hile..."
>         echo "lvremove -y ${devname}" >> ${LOGFILE} 2>&1
>         lvremove -y ${devname} >> ${LOGFILE} 2>&1
>         if [ $? -ne 0 ]; then
> @@ -417,6 +456,7 @@ function xenguest_guest_remove()
>     fi
>=20
>     # remove guest files
> +    echo "${PREF} Removing ${guestname} configuration files."
>     rm -rf ${XENGUEST_CONF_BASE}/guests/${guestname}
> }
>=20
> @@ -602,6 +642,7 @@ case ${cmd} in
>         fi
>=20
>         xenguest_guest_create ${guestfile} ${guestname}
> +        echo "${PREF} ${guestname} created."
>         ;;
>     remove)
>         guestname=3D"${arg1:-}"
> @@ -619,6 +660,7 @@ case ${cmd} in
>             fi
>         fi
>         xenguest_guest_remove ${guestname}
> +        echo "${PREF} ${guestname} removed."
>         ;;
>     start)
>         guestname=3D"${arg1:-}"
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manage=
r.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
> index 65925d2..bd7963f 100644
> --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
> @@ -46,7 +46,7 @@ do_install() {
> }
>=20
> # Things that we need on the target
> -RDEPENDS_${PN} +=3D "bash tar xenguest-mkimage lvm2 xen-tools parted e2=
fsprogs"
> +RDEPENDS_${PN} +=3D "bash tar xenguest-mkimage lvm2 xen-tools parted e2=
fsprogs dosfstools"
>=20
> FILES_${PN} +=3D "${bindir}/xenguest-manager \
>                ${sysconfdir}/xenguest"
> --=20
> 2.7.4
>=20
>=20

