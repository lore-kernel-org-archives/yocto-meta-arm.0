Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.85])
 by mx.groups.io with SMTP id smtpd.web12.11463.1596124547463505652
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 08:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=mICz84RL;
 spf=pass (domain: arm.com, ip: 40.107.8.85, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1ygGWdEgKUDgh7oFKmE2Ex9TbX99eUYRGQKfQ2mgJs=;
 b=mICz84RLgIuMLRnMY7/x8/V14VyifxZ4YgwoJZHii92RIF1MouhShBWoPXMca6nzK74x0EkuuiClM9USySsKeh+BWlPTUO4bewMge4VyDaiVyyRgJBA2ZrmrrirmCUFpHJqFa5H9+WBNiu4gQnbdWBk30NzN76kmVL1d2BsbaIw=
Received: from DB6PR0301CA0030.eurprd03.prod.outlook.com (2603:10a6:4:3e::40)
 by DBBPR08MB4839.eurprd08.prod.outlook.com (2603:10a6:10:da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Thu, 30 Jul
 2020 15:55:44 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::b6) by DB6PR0301CA0030.outlook.office365.com
 (2603:10a6:4:3e::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Thu, 30 Jul 2020 15:55:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Thu, 30 Jul 2020 15:55:44 +0000
Received: ("Tessian outbound 2ae7cfbcc26c:v62"); Thu, 30 Jul 2020 15:55:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4d7a09f705531073
X-CR-MTA-TID: 64aa7808
Received: from 0b64ad64a635.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 974D8497-0B1B-4600-AAAD-9795089C3828.1;
	Thu, 30 Jul 2020 15:55:39 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0b64ad64a635.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Jul 2020 15:55:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxaRDdk8gD7kKN2b91JXa27XR8vJXzOvGL17pacBYXwuilbACdsNlOaPob3H2YX1lO85alxBe3AQ09YXBbWCk78Hk9953XlkSmiQ/lxcU0woQvrwRQcZHSxQ6I5Hz+wdnCVSBypPv+3URepUuS3m7a7gOrKsFtUmaplu89/7CmTxoEevha/+7SQXURiZHNcsg4zEeJyjXm7Sc1jdVDFJMC77VPvBkDShN936AB3lWZbXez7q6KSmEk08jS+u8a/+MdCOWHzuR4AW+Ko4U/1Tj90Z8F2+ND2HdAUtVcL9XRf+quZpHSLaz6XHrclWiv+E0yCfdDCqzeiLgulGHv7O5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1ygGWdEgKUDgh7oFKmE2Ex9TbX99eUYRGQKfQ2mgJs=;
 b=Nn6LnYDiWgs6fgV9tBIQNzMhD4w4qNeRgpj6mDpFyeXW/imDj24tIj+aN0/CDXxH6/4dPcTy2sSONouuPqnvTgFbSPZw36iFUpnEXKyf8QK+ZjogLqDW8bKbudE4Fw89+tJvmc87yBu0wuMA7AKPCp1/ZCS0D1mGNuodLwsO8FGtR+SUz+RC42FEd5zzWfiGMRPRKfjzDacP7frgzjf107h7R8a+Os8S3vPEt1pMEvQTdy9UJo1/wrpg575n7W8YOB0IKkhF8p9q7Q65ODZLXa/F5/eqUmDyYHBuwDhYeY1/2YY8LxPvhT9TA/3BzSk55b4StRylisdTdBFIWRQMnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1ygGWdEgKUDgh7oFKmE2Ex9TbX99eUYRGQKfQ2mgJs=;
 b=mICz84RLgIuMLRnMY7/x8/V14VyifxZ4YgwoJZHii92RIF1MouhShBWoPXMca6nzK74x0EkuuiClM9USySsKeh+BWlPTUO4bewMge4VyDaiVyyRgJBA2ZrmrrirmCUFpHJqFa5H9+WBNiu4gQnbdWBk30NzN76kmVL1d2BsbaIw=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3035.eurprd08.prod.outlook.com (2603:10a6:5:1d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.19; Thu, 30 Jul
 2020 15:55:37 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3216.033; Thu, 30 Jul 2020
 15:55:37 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/4] arm-autonomy/xen-tools: vif-nat script fixes
Thread-Topic: [meta-arm] [PATCH 1/4] arm-autonomy/xen-tools: vif-nat script
 fixes
Thread-Index: AQHWZomKyX0g5QDGL0CdJDSP1rdUjqkgRqcA
Date: Thu, 30 Jul 2020 15:55:37 +0000
Message-ID: <DA00AFF9-ABC1-4DDD-8FBC-FA5321249324@arm.com>
References: <1596124338-106961-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1596124338-106961-1-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: be0c0bc3-a8e6-4edd-f5f2-08d834a104a1
x-ms-traffictypediagnostic: DB7PR08MB3035:|DBBPR08MB4839:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB48399BF4DF4F09FD3DCCC5C89D710@DBBPR08MB4839.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 8vJ24Rt7Eoq2gsfgpKWPjMd6DRZemh7iQs92zdR9J29UzzIyFgmOFC3bN4D0CsULDofDpbGp0rMOXUA8CW/IJBq9nr7hZ/VJJ/H+XXTNK5Bdk7sv/M5UihvYezzGmeidduIBS+Y3x3pPwnC9oDfixIPJyAmtKDtWL6x72/TS6JyU5Sq6TMpo/ghs5R887aEZhnDXprobJBWE86gmEqDjgqr9qyTc3fJ573FUTG6sOCxC1dxtMK8SfhJetQdD2ZXpTrwMy/B7UAD3KohHvld2qegAE4CJzwEWxilMNSP8/tVWF/MiK+2Tt309rKgngndcdgeMugDAPknhjWA5Dp/O3yzEWZLhqGHhJfkuNIq7DtKpeJbDHVEBnT5l8lmx4Gx5gOqzHpjYbDv1IntUWC/NXw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(6862004)(71200400001)(4326008)(478600001)(64756008)(66446008)(66556008)(2906002)(66476007)(66574015)(83380400001)(966005)(33656002)(8936002)(66946007)(6512007)(186003)(86362001)(36756003)(26005)(76116006)(316002)(37006003)(6486002)(53546011)(5660300002)(6636002)(6506007)(8676002)(91956017)(54906003)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 IZzoTrkN181pBzptSV/OEitiLSgNR5YZYF1GLTc0PpbqEyirmfjGCD00tihQkrUub19Ql2R54VqLUV3Lc2/RHTp2fwCGvpMe7iZTATMuncMz2gLZ7vyo0EFe3O4wCzhYIy1ltCc3xGvUcXiR2Ehfm690C5T7vfQdpNqDI/2HAS1UdISulKvv6PAnNHJ/tOPSS1lxj/OzGCtXDMcGY93reP3Ys1gz/0e5073qy4pY8ffElr5QOyR6SyhzQ4CZ4upbSJ/zMRRYvrxKmhjcD0kRRNcpDuLt+zcgVxCFgDMGVilzll00bgWY+o830I0eHyGaBpSb/4jkYc++ZiCLMdcwDi5Z/xzH+z3PCc6z1780Cv23sFfYEKOqLJlfAISGVADprisgbhkDCPM8GP+aQ5650l7yCGMeDizTLeMmTUBWLLP9D5bgkPDf8Gfz/zaM6XjrKw4ovK7mol8WDijyoalObGsWFcvAQDwzuK4R2ON1LZAsjDuSl6qQ/ODrWzfJh/73KzgWWhdBlanI9H2ziBy1vmsimVmSlVD0TMwtYMlaE7Mm7CcW/fpSju/J8mSvT8UcqP+u7el+i/DUXP+bntK+a0DnwXhSk+zjUJ/oSZisPEingo8WKsN+9mODr1NAibUPqK4Nk9VX1tmzXP1y5PF69A==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3035
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dcc25177-77ce-4e03-984b-08d834a10066
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	guM+oLW+kj58bbURSrs6Tg/z2JBjxr62/kbTo4s5bIBhzmTwDlLNwAzJuCcD+VqDEJsvI8e9NrGyvkdqzdAdnxPOSRIS2pKp8el6DIisG0gBCoSf4OJcj0x/sHalRFs2DSLZkKCuaDkCxCajPNgDAa8iuqXJz+dlA5IGkinfzqKu37NCqiRl56b+4EIMQH97sxfdRGrPAhl5cijkqz08GPYUfJ/oxMp1vaTvdJT04IdoUh1EvQoF5kIGJJqunWPcgfg8/5/UigBQlxTFrAIiCzb5+VGGbG+Fb/lUAo127zyl4bplZoD302001bVkapxSjyTnl5rdDenFJ/dkXujXCwy91Y/tKxg4nAY92KIEymlrHQFGy+S8a49EAZYG/1J6kcRGfMlx35HwfZFtL2eJgTLmahQ2txe2NhFVSejhUUwqXzmGZeyEeE9x7LsJgLPeVGziXiewzsQFJJB4O0AHNg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966005)(81166007)(5660300002)(478600001)(37006003)(336012)(36756003)(82310400002)(70206006)(316002)(33656002)(2906002)(6486002)(6862004)(53546011)(186003)(356005)(2616005)(6636002)(70586007)(4326008)(8936002)(54906003)(83380400001)(86362001)(6506007)(82740400003)(8676002)(66574015)(6512007)(966005)(47076004)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 15:55:44.4957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be0c0bc3-a8e6-4edd-f5f2-08d834a104a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4839
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F8BDA200B9EBA44C8330E89ADC03FE8A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 30 Jul 2020, at 17:52, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> This patch introduces two fixes for the vif-nat script:
> 1- Setting the hostname is failing because the "$XENBUS_PATH/domain"
>   doesn't exist anymore. To fix this we set it to dom$domid.
> 2- Copy temp files used to add/remove dhcpd configurations to avoid
>   replacing potential symlinks.
>=20
> Change-Id: I5f2ed917c15bbe1c6ff9ec3cc9ad2fc4e1c0fb60
> Issue-Id: SCM-1019
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> .../xen/xen-tools/0001-vif-nat-fix-hostname.patch  | 18 +++++++++
> .../0002-vif-nat-fix-symlink-removal.patch         | 45 ++++++++++++++++=
++++++
> .../recipes-extended/xen/xen-tools_%.bbappend      |  5 +++
> 3 files changed, 68 insertions(+)
> create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-tools/0001=
-vif-nat-fix-hostname.patch
> create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-tools/0002=
-vif-nat-fix-symlink-removal.patch
> create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bb=
append
>=20
> diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools/0001-vif-n=
at-fix-hostname.patch b/meta-arm-autonomy/recipes-extended/xen/xen-tools/00=
01-vif-nat-fix-hostname.patch
> new file mode 100644
> index 0000000..87f25e2
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools/0001-vif-nat-fix-=
hostname.patch
> @@ -0,0 +1,18 @@
> +Upstream-Status: Pending
> +Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> +
> +Setting the hostname is failing because the "$XENBUS_PATH/domain"
> +doesn't exist anymore. To fix this we set it to dom$domid
> +
> +Index: git/tools/hotplug/Linux/vif-nat
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/tools/hotplug/Linux/vif-nat
> ++++ git/tools/hotplug/Linux/vif-nat
> +@@ -86,6 +86,7 @@ router_ip=3D$(routing_ip "$ip")
> + vif_ip=3D`echo ${ip} | awk -F/ '{print $1}'`
> +=20
> + hostname=3D$(xenstore_read "$XENBUS_PATH/domain" | tr -- '_.:/+' '----=
-')
> ++[ -z "${hostname}" ] && hostname=3Ddom$domid
> + if [ "$vifid" !=3D "1" ]
> + then
> +   hostname=3D"$hostname-$vifid"
> diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools/0002-vif-n=
at-fix-symlink-removal.patch b/meta-arm-autonomy/recipes-extended/xen/xen-t=
ools/0002-vif-nat-fix-symlink-removal.patch
> new file mode 100644
> index 0000000..bcd5778
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools/0002-vif-nat-fix-=
symlink-removal.patch
> @@ -0,0 +1,45 @@
> +Upstream-Status: Pending
> +Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> +
> +Copy temp files used to add/remove dhcpd configurations to avoid
> +replacing potential symlinks.
> +
> +Index: git/tools/hotplug/Linux/vif-nat
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/tools/hotplug/Linux/vif-nat
> ++++ git/tools/hotplug/Linux/vif-nat
> +@@ -99,7 +100,8 @@ dhcparg_remove_entry()
> +   then
> +     rm "$tmpfile"
> +   else
> +-    mv "$tmpfile" "$dhcpd_arg_file"
> ++    cp "$tmpfile" "$dhcpd_arg_file"
> ++    rm "$tmpfile"
> +   fi
> + }
> +=20
> +@@ -109,11 +111,11 @@ dhcparg_add_entry()
> +   local tmpfile=3D$(mktemp)
> +   # handle Red Hat, SUSE, and Debian styles, with or without quotes
> +   sed -e 's/^DHCPDARGS=3D"*\([^"]*\)"*/DHCPDARGS=3D"\1'"${dev} "'"/' \
> +-     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
> ++     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
> +   sed -e 's/^DHCPD_INTERFACE=3D"*\([^"]*\)"*/DHCPD_INTERFACE=3D"\1'"${=
dev} "'"/' \
> +-     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
> ++     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
> +   sed -e 's/^INTERFACES=3D"*\([^"]*\)"*/INTERFACES=3D"\1'"${dev} "'"/'=
 \
> +-     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
> ++     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
> +   rm -f "$tmpfile"
> + }
> +=20
> +@@ -125,7 +127,8 @@ dhcp_remove_entry()
> +   then
> +     rm "$tmpfile"
> +   else
> +-    mv "$tmpfile" "$dhcpd_conf_file"
> ++    cp "$tmpfile" "$dhcpd_conf_file"
> ++    rm "$tmpfile"
> +   fi
> +   dhcparg_remove_entry
> + }
> diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend=
 b/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
> new file mode 100644
> index 0000000..ef8eddd
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
> @@ -0,0 +1,5 @@
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> +
> +SRC_URI +=3D "file://0001-vif-nat-fix-hostname.patch \
> +            file://0002-vif-nat-fix-symlink-removal.patch \
> +           "
> --=20
> 2.7.4
>=20
>=20

