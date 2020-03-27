Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.86])
 by mx.groups.io with SMTP id smtpd.web10.14380.1585322899254070858
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 08:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qDKuyVQV;
 spf=pass (domain: arm.com, ip: 40.107.22.86, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4faQ0B4erJoG1xW1NEj6R/1qrs4KdxvtoPZlioHX54=;
 b=qDKuyVQVAC+j0cijEvu9JRaee5IA0cZcEpC/Q/yHEmVqn4fdy/hx1PPqsxYNVC8vUTImsNM0+R+V7Jau+CFjSDd+Yma1L5/w2LDbJLYW4TqxS2pxxINfdL/VKuQc2fW4IdcPCtghK+tmZvVyW1f2YcRuPWMFN5Yxv7DKeqWyqGI=
Received: from DB6P193CA0024.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::34) by
 DB6PR0801MB1925.eurprd08.prod.outlook.com (2603:10a6:4:74::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 15:28:16 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::b) by DB6P193CA0024.outlook.office365.com
 (2603:10a6:6:29::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19 via Frontend
 Transport; Fri, 27 Mar 2020 15:28:16 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 15:28:16 +0000
Received: ("Tessian outbound 60d769d68364:v48"); Fri, 27 Mar 2020 15:28:16 +0000
X-CR-MTA-TID: 64aa7808
Received: from a1d367c3a7b7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FA46E29E-CD17-4BD4-AB95-7B6240B97CDD.1;
	Fri, 27 Mar 2020 15:28:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a1d367c3a7b7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 15:28:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfmOMeCkV9hk+6TDMpWQw66CllD8gXIeTNsUB6R5biiTTu1G0wOCNX/rCVjSnBTTkjIXVstsvh2Wl9jAHHBGOYZT72dYWGLRvHIB66HFKSzlBpK6HbkdVwOd7zstRE338L5l+iG6NlrNTPVBThFyfU5Uoh2Jwc6PzQlSBAtcwQ9zxa4A/UfyWUn9LlaQpMlI9STvT8k4stLcZoxWcwupXRNspV0lLDF5h0pa4aZffz/v6+SKAqCheSHpUC6ruFXNLqmfyWubyxeDAyKRdLFfJyAIcZDGsNfUaOkhC1nrTTYAOR9q5+Fw+DcflPoTjHHxYgeE7IXehDSHqlDftskfZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4faQ0B4erJoG1xW1NEj6R/1qrs4KdxvtoPZlioHX54=;
 b=LKrTSAxFfBHqq3FG4xoLdsy5w9q6OWVpP1511Ce7HN1991NTU8MmwHGlGjyUYQilQPsumLekWnSaF/U4ZWPt8zBdi8ahppHuIg2mlAYjaKa/UT6IDH/mnbnobULLefYK0ZWw352eC4ZJxQt4K/4WDmJ9s0OTHGVFan41CepCcFimi65b6Xarmpqu2cNqd+ENCQNtpKoZYcYS+5p4Mt0xHz9Av/jx3yCyDdss+43paAdc67jalaDKagJpoR64bFJwVpL9AF0La3HTU6r+7nYX8X+54/qvR8Hp7WK6fVyz3rF0Pk50SQHNP4S2cOo/sIItGYAWpEqGCDjlnUacjzx5Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4faQ0B4erJoG1xW1NEj6R/1qrs4KdxvtoPZlioHX54=;
 b=qDKuyVQVAC+j0cijEvu9JRaee5IA0cZcEpC/Q/yHEmVqn4fdy/hx1PPqsxYNVC8vUTImsNM0+R+V7Jau+CFjSDd+Yma1L5/w2LDbJLYW4TqxS2pxxINfdL/VKuQc2fW4IdcPCtghK+tmZvVyW1f2YcRuPWMFN5Yxv7DKeqWyqGI=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB4513.eurprd08.prod.outlook.com (20.179.36.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Fri, 27 Mar 2020 15:28:10 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 15:28:10 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 4/7] arm-autonomy: Create xenguest-base-image recipe
Thread-Topic: [meta-arm] [PATCH 4/7] arm-autonomy: Create xenguest-base-image
 recipe
Thread-Index: AQHWBCXl7D8xMiqSZ0qygP1FYASGAahckDcA
Date: Fri, 27 Mar 2020 15:28:09 +0000
Message-ID: 
 <AM0PR08MB39877018D93D1CE770EA4C3C92CC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200327105223.460-1-bertrand.marquis@arm.com>
 <20200327105223.460-5-bertrand.marquis@arm.com>
In-Reply-To: <20200327105223.460-5-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 4be66827-543f-4664-a289-38e448b9a8f4.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [5.68.4.242]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fd28f894-05cc-4666-d65c-08d7d26378b2
x-ms-traffictypediagnostic: AM0PR08MB4513:|DB6PR0801MB1925:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB19250CA2A4F94D53DBA5D02692CC0@DB6PR0801MB1925.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:913;OLM:913;
x-forefront-prvs: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(55016002)(66446008)(9686003)(76116006)(26005)(81166006)(81156014)(6916009)(52536014)(33656002)(71200400001)(4326008)(316002)(5660300002)(8676002)(64756008)(66946007)(8936002)(478600001)(66476007)(53546011)(86362001)(7696005)(55236004)(2906002)(66556008)(186003)(6506007);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 V7SIPTA6wtmLSQoE3i5nB3AOfBwzJE3ANfEit+t0hqHXZQv+s+v6ep0uZfh68DTsssA4V32ojL2AeJKWqPaBgK8zGG4KYN7tkWuYYDTAu7iNLNcka/DLcc7kSz+sccbOiG6ymu5XJcx5/R2Kg4vH/0RQFyROzgPFstx8uatIne7v0PSD+BtW/HPuC8pK2Mf1odG2DcOw+nhKOrdKb5xbl3YZnRKaioyRsIv8py9hlc/Cm3U8zRZTw9DKSXLDD3vuvaIfoOFZSXvSw5zuXJEXY33eQrrHK/fpITc2zRQvj1VzvZofxa8dpJGY40QI5Ifxj2oHJFyaanoD5gi85Dk2LaZKdjPE67CmDarR2FxZZz4mQFGIURuaGWs8YhPTdunlaomYqNxRsMfKGifxEUpzV3WFkHsvisvumgbnyKEaVNF2ZQnZUrCZP3pkK5IYfyuwgLjLgMy6Q0FVzrZQsYZWPlAc6korfpkYOqInZm3lD0O8jVtfdTidN/BIxgCZ9LJpsal29IYhh9CqagDV20dtAQ==
x-ms-exchange-antispam-messagedata: 
 8l0/lgwCR4WjudbLBhz3IraeOe51GWnjB+g4R/zVkWCFshzgigkejNyllYVvuDqLGFWOAGFl8Qq78pFZQS0KET9dgN0KtfFjRoFoGZ1K36xGMjCas/LXyfmHKNf+7m8Gf1bjk2mWPQKHZmbvFMyphg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4513
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966005)(86362001)(33656002)(9686003)(4326008)(5660300002)(52536014)(356004)(336012)(53546011)(6506007)(82740400003)(47076004)(55016002)(478600001)(186003)(81156014)(81166006)(8936002)(8676002)(26005)(316002)(70586007)(70206006)(26826003)(6916009)(7696005)(2906002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7ca1663d-3f83-439f-b9b8-08d7d26374df
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iTnri5dbGdVBMs6+E8wAFtJ0cDZYh0o2LfskPZw0d2404vYKxLrz8C7PIPnakLtx23GmqGFWsVC5Kr0F4O4mH0WyCapJ6REbWrhKQaRk3ceZzk0o98obTUL/ZGgIws58bsqvy6yd7QAd0HwjzUnSFRuRWMv3XcFmFIuDiDBb216lXt8w8ZSK1MX9cerRVxivx+RbhkHQfGNjgV+yl+UhWvcuYYNY5gitnoCjuCuGRfvyICiddqLySKcIXZxXN7lRrPXoYQO8lIs/3392+UP0/+JcMlEtWEpaEABYsyczN+YqIS8wAfmBf4kOyFQMzd97/pBWddbV0koBH/GyhacNj4LdELiJZcIR4gPpJ0NvhE+ie6LHier5LtlyNzNYkQOp1JFxLP7MPxRBXjBHWRQ0cYjPhmYvQDi+PkhTUThFLyYiFKeyMwNZhTo4NnSCSIVEkPjhQ9kkY4Kg8jauNfST1czxh4UxtzNmTqV7OgtsnpHF8qLnAeY63e+eG4iIKm0oX4uZgBRi6PZv40mHHx66WthaJlOky32qGN+kYhcGSDVGCarHdx2/1g4ZDnnnw7tZDuOxHcArAf28pkVUwkVdlscAegf4OJ3tjLpieXdFMjM=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 15:28:16.4725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd28f894-05cc-4666-d65c-08d7d26378b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1925
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Bertrand Marquis via Lists.Yoctoproject.Org
> Sent: 27 March 2020 10:52
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH 4/7] arm-autonomy: Create xenguest-base-image
> recipe
>=20
> Add xenguest-base-image recipe to create an initial xenguest image direct=
ory
> in deploy.
> This is using the xenguest-image class.
> The recipe is also introducing several parameters named
> XENGUEST_IMAGE_SRC_URI_* to allow the user to specify files or elements t=
o
> be added to the xenguest image.
> Those parameters are documented inside the recipe.
>=20
> Change-Id: I806a2fa07fb9593c366d88e2f4ee8b649cbcf8ea
> Issue-Id: SCM-767
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../xenguest/xenguest-base-image.bb           | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 meta-arm-autonomy/recipes-
> extended/xenguest/xenguest-base-image.bb
>=20
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-
> image.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-
> image.bb
> new file mode 100644
> index 0000000..ea4a9f3
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-
> image.bb
> @@ -0,0 +1,116 @@
> +# Create a xenguest base image
> +#
> +# This recipe creates a base image that is then extended by other
> +recipes # through xenguest-image class.
> +# xenguest image type is using this as base to add a kernel and a disk
> +image # to create a guest # # The recipe is also adding files in those
> +directories to the xenguest image:
> +# - ${WORKDIR}/extend/disk-files: all files in this directory will be ad=
ded to
> +#   the guest disk files (using --disk-add-file)
> +# - ${WORKDIR}/extend/files: all files in this directory will be added t=
o the
> +#   guest xen files (using --xen-add-file)
> +# - ${WORKDIR}/extend/guest.d: all files in this directory will be added=
 to
> +#   the xen append configuration files (using --xen-append)
> +# - ${WORKDIR}/extend/init.[pre|post|d]: all files in those directories =
will
> +#   be added to the corresponding init scripts (using --init-[pre|post|s=
cript])
> +# You can bbappend this recipe and put files in ${WORKDIR}/extend to
> +add # elements to the image.
> +#
> +
> +DESCRIPTION =3D "Xenguest Base Image"
> +LICENSE =3D "MIT"
> +
> +LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b
> 4f302"
> +
> +#
> +# The following variables can contain SRC_URI compatible entries to add
> +# files to the xenguest image.
> +# You can set those variable in local.conf to add one or several files
> +# For example to add a boot.tar.gz file that you download to the file #
> +useable for disk partition initialisation:
> +# XENGUEST_IMAGE_SRC_URI_DISK_FILES +=3D
> "https://www.test.com/files/boot.tar.gz"
> +
> +# Add disk files
> +XENGUEST_IMAGE_SRC_URI_DISK_FILES ??=3D ""
> +
> +# Add xen files
> +XENGUEST_IMAGE_SRC_URI_XEN_FILES ??=3D ""
> +
> +# Add xen configuration elements
> +XENGUEST_IMAGE_SRC_URI_XEN_CONFIG ??=3D ""
> +
> +# Add pre init script
> +XENGUEST_IMAGE_SRC_URI_INIT_PRE ??=3D ""
> +
> +# Add init script
> +XENGUEST_IMAGE_SRC_URI_INIT ??=3D ""
> +
> +# Add post init script
> +XENGUEST_IMAGE_SRC_URI_INIT_POST ??=3D ""
> +
> +# Add init script
> +
> +S =3D "${WORKDIR}"
> +
> +inherit deploy xenguest-image
> +
> +# parse XENGUEST_IMAGE_SRC_URI_ variables and add them to SRC_URI
> +python __anonymous() {
> +    def parse_extend_variable(d, varname, destdir):
> +        list =3D d.getVar(varname)
> +        if list:
> +            for entry in list.split():
> +                #Check the URL
> +                try:
> +                    decode =3D bb.fetch.decodeurl(entry)
> +                    d.appendVar('SRC_URI', ' ' + entry + ';unpack=3D0;su=
bdir=3Dextend/' +
> destdir)
> +                except:
> +                    bb.fatal("%s: %s contains an invalid URL:  %s" \
> +                    % (d.getVar('PF'), varname, entry))
> +
> +    parse_extend_variable(d, 'XENGUEST_IMAGE_SRC_URI_DISK_FILES', 'disk-
> files')
> +    parse_extend_variable(d, 'XENGUEST_IMAGE_SRC_URI_XEN_FILES', 'files'=
)
> +    parse_extend_variable(d, 'XENGUEST_IMAGE_SRC_URI_XEN_CONFIG',
> 'guest.d')
> +    parse_extend_variable(d, 'XENGUEST_IMAGE_SRC_URI_INIT_PRE',
> 'init.pre')
> +    parse_extend_variable(d, 'XENGUEST_IMAGE_SRC_URI_INIT', 'init.d')
> +    parse_extend_variable(d, 'XENGUEST_IMAGE_SRC_URI_INIT_POST',
> +'init.post') }
> +
> +# Make sure we are removing old files before redoing a fetch
> +do_fetch[cleandirs] +=3D "${WORKDIR}/extend"
> +
> +do_configure[noexec] =3D "1"
> +do_compile[noexec] =3D "1"
> +do_install[noexec] =3D "1"
> +
> +add_extend_files() {
> +    local subdir=3D"$1"
> +    local cmd=3D"$2"
> +
> +    if [ -d ${WORKDIR}/extend/$subdir ]; then
> +        filelist=3D$(find ${WORKDIR}/extend/$subdir -type f)
> +
> +        if [ -n "$filelist" ]; then
> +            for f in $filelist; do
> +                call_xenguest_mkimage update --$cmd=3D$f:$(basename $f)
> +            done
> +        fi
> +    fi
> +}
> +
> +do_deploy() {
> +    # Create a new image
> +    xenguest_image_create
> +
> +    # Add our extra files if any
> +    add_extend_files "disk-files" "disk-add-file"
> +    add_extend_files "files" "xen-add-file"
> +    add_extend_files "guest.d" "xen-append"
> +    add_extend_files "init.pre" "init-pre"
> +    add_extend_files "init.d" "init-script"
> +    add_extend_files "init.post" "init-post"
> +}
> +
> +addtask deploy after do_install before do_build
> +
> --
> 2.17.1

