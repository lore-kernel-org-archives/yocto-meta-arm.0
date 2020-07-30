Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.82])
 by mx.groups.io with SMTP id smtpd.web12.11476.1596124577328775289
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 08:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=vrP7JoAO;
 spf=pass (domain: arm.com, ip: 40.107.20.82, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lRW6bBKnHUoXFWy/zJblk6rEUKw3411cXMShes86Mo=;
 b=vrP7JoAOK/k6+9mFdOsJDedJ1n87Q9szDEx7qCkN6/ee//nbMTEpoxuyyPbGh3bm7jsWKyIHh2YqRb+ZoPin0TDF2xc8O/ZK3OleCXDca5eiDJlHZ5UpEvsScMHHH9lSCK3cT8yXF/1v08wOsFrTD1ZyfvsoC9NX5qMo5rotLwY=
Received: from AM5PR1001CA0040.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::17) by AM6PR08MB3685.eurprd08.prod.outlook.com
 (2603:10a6:20b:6f::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 30 Jul
 2020 15:56:15 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::bf) by AM5PR1001CA0040.outlook.office365.com
 (2603:10a6:206:15::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Thu, 30 Jul 2020 15:56:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Thu, 30 Jul 2020 15:56:14 +0000
Received: ("Tessian outbound 73b502bf693a:v62"); Thu, 30 Jul 2020 15:56:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 366eaf02ef5d77fc
X-CR-MTA-TID: 64aa7808
Received: from b7ad3313897b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E29E4654-60E7-422A-9013-EBE45B9F7665.1;
	Thu, 30 Jul 2020 15:56:09 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b7ad3313897b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Jul 2020 15:56:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqrTEfJT1mtxkgbNikzwZW+TkBaeJXn453mo8wekZwIJruA5YP1/SQsrpixN0xvMFK7O0Bk4OMHAzArC/BqkkSjmNMJM66fho+wolgE9eXUMn2u8YGnucU9hxPcPOv3vQvYlIT06Xn/0BwpPJeHsfvjR4fFMcyuryRndJ8Prk9bFxQzJgfqk+Ia1IPJH/WuKo2GEGOtvmz+ci3atp/6+K8wJIYTZKFImXrp0v5At+Dm4Rqklhnaf+7ttQrY4hWzTS1MHt7SBmUEONnRzsZRf/Kdvjlii3eMo67ZHcQngDDo4F5gX6anFiGsVuFBzTw/C+5/Nk4qg9S7oOLrYW82fLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lRW6bBKnHUoXFWy/zJblk6rEUKw3411cXMShes86Mo=;
 b=HdV2UvhAe62QR4R6x0woWmpmwQuwbYjZjTi3D2SapT7/q1EIt5jh1Gkao0NBiR4BCC29fkQ4GgAN266F6DLJjvEjdtEol1HQ4RCpz8LAZQFnAUp3h8LCFb+kMf48+QXa5Ps+DgxEXXFlI7cN4AtBT08X4jknZGw7j3jizJuDVHPG0yPvbRje3q+7ek7iXwww3jKf++KnEMhV7J6AKhz9b6DYTT/QEa5JDrEGBunZAyFkQhQpwXWeD2q9QYAE1rGygzB5yHbC+XHN2IKnWlxOwaMGsEi5EbxYh9gJk0IvjzCvQVtTAZf2m5Wltj59tkzQuk7M7hEiexZ2NW3IV5PswQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lRW6bBKnHUoXFWy/zJblk6rEUKw3411cXMShes86Mo=;
 b=vrP7JoAOK/k6+9mFdOsJDedJ1n87Q9szDEx7qCkN6/ee//nbMTEpoxuyyPbGh3bm7jsWKyIHh2YqRb+ZoPin0TDF2xc8O/ZK3OleCXDca5eiDJlHZ5UpEvsScMHHH9lSCK3cT8yXF/1v08wOsFrTD1ZyfvsoC9NX5qMo5rotLwY=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5371.eurprd08.prod.outlook.com (2603:10a6:10:114::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Thu, 30 Jul
 2020 15:56:07 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3216.033; Thu, 30 Jul 2020
 15:56:07 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH 4/4] arm-autonomy/xenguest-network: Add NAT port forward support
Thread-Topic: [meta-arm] [PATCH 4/4] arm-autonomy/xenguest-network: Add NAT
 port forward support
Thread-Index: AQHWZomnAdD6ECypGEmOvJMrDajFKKkgRsuA
Date: Thu, 30 Jul 2020 15:56:07 +0000
Message-ID: <C0F253F6-8E6B-44F1-A348-E77E2AF291B8@arm.com>
References: <1596124338-106961-1-git-send-email-diego.sueiro@arm.com>
 <1596124338-106961-4-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1596124338-106961-4-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e411d036-a6e4-41f5-17a7-08d834a116c6
x-ms-traffictypediagnostic: DB8PR08MB5371:|AM6PR08MB3685:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB36855D365FB06A9E4D8D6F229D710@AM6PR08MB3685.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3276;OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /i32XiaQasOdDhR97+ptCDrZdLHUVjOTbcsKDGKTCUYCrtv2i06qdKquWchbViuYzSfK9c4QEVCSaRI+HFoLYnKFJEAl5nrYZVweK2bgMi1SZTZw1lOrmY7nih3YY4O9do6rGMYDAmkpWvs6ckrzuhjdgSBpYRD/qSNU142zt+lh7J8uCMHNOw3R0G1pQgPVEFi2sakEc6k5ZeRP3AtKcqpK5FiyNbgOYAYbNDAMmZgAjWvl6JRwX01eandYaSyrI+NmSx3BiCHS//HFlhF3Mu2ca7dWXetDIHx783A3barP8sHSdyxbqnepVmNIHj83kQmSZm5Cz8pGwWGitfc2v2Eo2K51r5BsfKOjcx4RM4bBjxcrgzNwaNw6tNUv/2KpjF5WUzRtq4QO/dCYF4QkAg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(2906002)(2616005)(33656002)(83380400001)(186003)(5660300002)(4326008)(26005)(66476007)(66556008)(6862004)(6636002)(66446008)(64756008)(6506007)(76116006)(66946007)(6486002)(53546011)(478600001)(8936002)(36756003)(966005)(316002)(54906003)(86362001)(8676002)(6512007)(71200400001)(91956017)(37006003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 fZbBanAET6c55S0a46zTbeG1430ndF3RSLvwHQyCOPLEsa69PLscbZelS1RkIH3lde8QGuMiqnYrbn+ytxCoupvrc4wi4o6Fm/Jfz3ZMV75Ct2/DYl7xaeYPnjVZwCrWabVHiCn4/9XVoDQwnLbhCkgp0s+FfIOE0GtO0vMbwWvglBz58pW7O8262b9rCjtmHtNCQ649H7cvthQuBqMTyIKksfXIWFLBOnbJLqGA1+2iPQH4jKp4E1SLEFyNNcQDJd1ROzEtd1UpY7cdAJI6YHGpz5tXX2LCjXaj3mgRshs2Bzn7L9joOdsd2WPEpbq84DqP2yFcDsPh4rjTJUWdI7Rot/0mJbLrQ7Bol//s9MItLa8XNUnDyapFPKSENSiVuo9X2JmNalmuExJshazw08vuSDWQ1Rz8KYjzULvlFR3OtYoc6oAMk95/CJDawFXiNCqo1jyouIHCAmo8lVG6M/LQ8TAgfIJES3qkwQjSiluGDLtUSPb2sUU+c0Wnsrblv6qVXFj82CBBbTKBVANe9dHYqunP9zSFkr1U9tK2LzMR1cT0XB64XsZ4u+T6YwL+T7T6blJ/RkGp9cuLTwvD0poHHuFALUkG2k07DL3dh+0LSq6F3Ok4oizQ5+X+xVciF76R2jRtvA6xY1PWOmc0TA==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5371
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fa653fd5-0841-4968-0531-08d834a1129f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q2/5IHIWWJcFjKDd4k+MzBRGdgX6G7EbGAXvl72UKVdjpBQO1MMguQKWCbkobcvfuWseFOryH69QizneAPj7X0JkeAvKai0fFqXqw42mVS2827hD4FbqRAPoTi+iVPvURbVFMwKr6vhd/wyqka7/LcTyYe9M1MfhUAGZNLmEImMLamysuY5/Ka24IEMlcbuK7BicQS4LHZw1c9BdBIN8zJptYiqSGLBYCignZq35T32j8Q1UomONJspMR/FU4fEWEOCC3TAGZ37pNKGHl47vUTKh0XvEtW518owoY4o+cKd1HfRWjT+9dHs6trbCVriHvYQD02CNjtJ88Wv6/0GsmV/KdTNpRN9nMBAeBlBVZEKLYLaEaR4qJMb5wkrrb3SHb8X6Sk+xp0FP3zFdPZv8YDaDUgBBu7cX9LkltFg5JfSdstbiLzW/4I7XpgkvcMz9ZYLrXV3gfx41JIbDLrpcIxUDbfAWZFRNkIu56/5flnw=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(46966005)(8676002)(86362001)(47076004)(4326008)(2906002)(82740400003)(8936002)(82310400002)(70586007)(70206006)(36756003)(478600001)(33656002)(81166007)(6862004)(6636002)(83380400001)(356005)(2616005)(26005)(316002)(54906003)(6512007)(966005)(5660300002)(36906005)(336012)(53546011)(6506007)(6486002)(186003)(37006003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 15:56:14.8771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e411d036-a6e4-41f5-17a7-08d834a116c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3685
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <84220A738A73744A9754EF068AEBE320@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 30 Jul 2020, at 17:52, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> When XENGUEST_IMAGE_NETWORK_TYPE=3D"nat", add the option to set NAT port
> forward to have access to the guest from the external network.
>=20
> The port forward is applied per guest by the 00-xenguest-nat-port-forwar=
d.hook
> script which is called by /etc/xen/scripts/vif-post.d/00-vif-xenguest.ho=
ok.
> The ports can be customised by the XENGUEST_IMAGE_HOST_PORT and
> XENGUEST_IMAGE_GUEST_PORT variables.
>=20
> Change-Id: I49492f5ac881fd3cc38838ce24d1d4160a4e65df
> Issue-Id: SCM-1019
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> .../documentation/xenguest-network.md              |  6 +++
> .../xenguest/files/00-vif-xenguest.hook            | 16 ++++++++
> .../files/00-xenguest-nat-port-forward.hook        | 48 ++++++++++++++++=
++++++
> .../xenguest/xenguest-base-image.bb                | 28 ++++++++++++-
> .../recipes-extended/xenguest/xenguest-network.bb  |  1 +
> 5 files changed, 97 insertions(+), 2 deletions(-)
> create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/00-=
xenguest-nat-port-forward.hook
>=20
> diff --git a/meta-arm-autonomy/documentation/xenguest-network.md b/meta-=
arm-autonomy/documentation/xenguest-network.md
> index c61a11a..b731f3e 100644
> --- a/meta-arm-autonomy/documentation/xenguest-network.md
> +++ b/meta-arm-autonomy/documentation/xenguest-network.md
> @@ -66,5 +66,11 @@ The following parameters are available:
>   image is created. It will be consumed by the
>   "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook" script which is cal=
led by
>   "/etc/xen/scripts/vif-nat" script when starting/stopping the xenguest.
> +  In the guest project, the NAT port forward can be customised by chang=
ing
> +  the XENGUEST_IMAGE_HOST_PORT (default: "1000 + ${domid}") and
> +  XENGUEST_IMAGE_GUEST_PORT (default: "22") variables in local.conf or
> +  xenguest-base-image.bbappend. This configuration is implemented and i=
nstalled
> +  in "/etc/xenguest/guests/${guestname}/files/00-xenguest-nat-port-forw=
ard.hook"
> +  script which is called by "/etc/xen/scripts/vif-post.d/00-vif-xengues=
t.hook".
>   The **none** type will not affect any networking setting between on do=
m0 and
>   domU.
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xe=
nguest.hook b/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xeng=
uest.hook
> index 32d5976..7a2fb6f 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.=
hook
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.=
hook
> @@ -95,6 +95,20 @@ dhcpd_offline(){
>                                        # are no vifs.
> }
>=20
> +call_extra_hooks() {
> +    for f in /etc/xenguest/guests/${guestname}/files/*.hook; do
> +        if [ -x "$f" ]; then
> +            log info "Executing $f"
> +            . "$f"
> +            if [ $? -ne 0 ]; then
> +                log err "$f failed."
> +            fi
> +        else
> +            log info "$f is not executable. Skipping."
> +        fi
> +    done
> +}
> +
> case "${XENGUEST_NETWORK_TYPE}" in
>     nat)
>         XENGUEST_DHCPD_PARAMS_FILE=3D${XENGUEST_DHCPD_PARAMS_FILE:-"/etc=
/xenguest/guests/${guestname}/files/dhcpd-params.cfg"}
> @@ -126,5 +140,7 @@ case "${XENGUEST_NETWORK_TYPE}" in
>                ;;
>         esac
>=20
> +        # We might have extra configs to be applied (e.g.: NAT port for=
ward).
> +        call_extra_hooks
>         ;;
> esac
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/00-xengue=
st-nat-port-forward.hook b/meta-arm-autonomy/recipes-extended/xenguest/file=
s/00-xenguest-nat-port-forward.hook
> new file mode 100755
> index 0000000..875c181
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/00-xenguest-nat-=
port-forward.hook
> @@ -0,0 +1,48 @@
> +#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +# /etc/xenguest/guests/${guestname}/files/00-xenguest-nat-port-forward.=
hook
> +#
> +# Script for performing local configuration related to NAT port forward=
ing of
> +# a vif.
> +# This script will be sourced by
> +# /etc/xen/scripts/vif-post.d/00-vif-xenguest.hook when
> +# XENGUEST_IMAGE_NETWORK_TYPE=3D"nat".
> +# The ${bridge} and ${domid} are set in the 00-vif-xenguest.hook contex=
t,
> +# and ${vip_if} in the vif-nat script context.
> +#
> +# Environment vars:
> +# command     (add|remove|online|offline)
> +# dev         vif interface name (required).
> +# main_ip     IP address of Dom0
> +# ip          list of IP networks for the vif, space-separated
> +# XENBUS_PATH path to this device's details in the XenStore (required).
> +#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +host_port=3D"###HOST_PORT###"
> +guest_port=3D"###GUEST_PORT###"
> +
> +port_num_check() {
> +    if [ ${host_port} -gt 65535 -o ${guest_port} -gt 65535 ]; then
> +        log error "host_port=3D${host_port} or guest_port=3D${guest_por=
t} greater than 65535."
> +        return 1
> +    fi
> +    return 0
> +}
> +
> +case "${command}" in
> +    online)
> +        port_num_check
> +        if [ $? -eq 0 ]; then
> +            iptables_w -t nat -A PREROUTING -i ${bridge} -p tcp \
> +                       --dport ${host_port} -j DNAT \
> +                       --to-destination ${vif_ip}:${guest_port} \
> +                       -m comment --comment "dom${domid}"
> +        fi
> +        ;;
> +    offline)
> +        # Remove the NAT iptables rules created for the dom${domid}
> +        guest_ipt_rule=3D$(iptables_w -t nat -vL PREROUTING -n --line-n=
umber \
> +                         | grep -w dom${domid} | awk '{print $1}' | tac=
)
> +        for rule in ${guest_ipt_rule}; \
> +            do iptables_w -t nat --delete PREROUTING ${rule}; done
> +        ;;
> +esac
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-i=
mage.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.b=
b
> index 8516fe8..d164a81 100644
> --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
> @@ -23,6 +23,16 @@ LICENSE =3D "MIT"
>=20
> LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
>=20
> +# When XENGUEST_IMAGE_NETWORK_TYPE=3D"nat", the "00-xenguest-nat-port-f=
orward.hook"
> +# is called by "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook" to ap=
ply NAT
> +# port forwarding. Both dom0 and domU ports can be be set by changing t=
he
> +# XENGUEST_IMAGE_HOST_PORT and XENGUEST_IMAGE_GUEST_PORT variables in l=
ocal.conf
> +# or xenguest-base-image.bbappend. The XENGUEST_IMAGE_NAT_PORT_FORWARD_=
SCRIPT
> +# can also be replaced in a xenguest-base-image.bbappend
> +XENGUEST_IMAGE_HOST_PORT ?=3D "\$( expr 1000 + \${domid} )"
> +XENGUEST_IMAGE_GUEST_PORT ?=3D "22"
> +XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT ?=3D "00-xenguest-nat-port-forwa=
rd.hook"
> +
> #
> # The following variables can contain SRC_URI compatible entries to add
> # files to the xenguest image.
> @@ -40,7 +50,12 @@ XENGUEST_IMAGE_SRC_URI_DISK_FILES ??=3D ""
> # The dhcpd-params.cfg holds the dhcpd configuration for Dom0. And it is=
 used
> # when XENGUEST_IMAGE_NETWORK_TYPE=3D"nat". Any customizations to it sho=
uld be
> # performed by replacing it via a xenguest-network.bbappend.
> -XENGUEST_IMAGE_SRC_URI_XEN_FILES =3D "file://dhcpd-params.cfg"
> +# The XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT file is only added if the
> +# variable is set.
> +XENGUEST_IMAGE_SRC_URI_XEN_FILES =3D "file://dhcpd-params.cfg \
> +    ${@ "file://" + d.getVar('XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT') =
\
> +      if d.getVar('XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT') else "" } \
> +    "
>=20
> # Add xen configuration elements
> XENGUEST_IMAGE_SRC_URI_XEN_CONFIG ??=3D ""
> @@ -82,8 +97,8 @@ python __anonymous() {
>=20
> # Make sure we are removing old files before redoing a fetch
> do_fetch[cleandirs] +=3D "${WORKDIR}/extend"
> +do_fetch[vardeps] +=3D "XENGUEST_IMAGE_HOST_PORT XENGUEST_IMAGE_GUEST_P=
ORT"
>=20
> -do_configure[noexec] =3D "1"
> do_compile[noexec] =3D "1"
> do_install[noexec] =3D "1"
>=20
> @@ -107,6 +122,15 @@ add_extend_files() {
>     fi
> }
>=20
> +do_configure() {
> +    if [ -f ${WORKDIR}/extend/files/${XENGUEST_IMAGE_NAT_PORT_FORWARD_S=
CRIPT} ]; then
> +        sed -i "s,###HOST_PORT###,${XENGUEST_IMAGE_HOST_PORT}," \
> +               ${WORKDIR}/extend/files/${XENGUEST_IMAGE_NAT_PORT_FORWAR=
D_SCRIPT}
> +        sed -i "s,###GUEST_PORT###,${XENGUEST_IMAGE_GUEST_PORT}," \
> +               ${WORKDIR}/extend/files/${XENGUEST_IMAGE_NAT_PORT_FORWAR=
D_SCRIPT}
> +    fi
> +}
> +
> do_deploy() {
>     # Create a new image
>     xenguest_image_create
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-networ=
k.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
> index fa4f93f..206a294 100644
> --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
> @@ -62,6 +62,7 @@ RDEPENDS_${PN} +=3D "bridge-utils \
>                    kernel-module-xt-tcpudp \
>                    kernel-module-xt-physdev \
>                    kernel-module-xt-comment \
> +                   kernel-module-xt-nat \
>                   "
> FILES_${PN} +=3D "${sysconfdir}/network/interfaces.d/xenguest-network-br=
idge.cfg"
> FILES_${PN} +=3D "${sysconfdir}/xenguest/init.pre/network-bridge.sh"
> --=20
> 2.7.4
>=20
>=20

