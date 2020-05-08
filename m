Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.51])
 by mx.groups.io with SMTP id smtpd.web11.6888.1588928499747372707
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 May 2020 02:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=88SrL5QV;
 spf=pass (domain: arm.com, ip: 40.107.4.51, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUZ9pas42bNgfvD3isCUhkOb8odC27g2JE78+x5lxcI=;
 b=88SrL5QV2jArB0BBv0h1rvjrA/rTSEQjemtF05XMtO54pknPQfFkb+ynl0N7OQdu5C+QYLeeftl4Sro0XycfAqxAqwctE3Oq63MqkkSUfonIbfCe+koEIXWpllc2bl2x2cLX8OOjGdnInylXO/3JqWnX6ZN6dePwFAgQ8OLXvM8=
Received: from AM5PR0502CA0022.eurprd05.prod.outlook.com
 (2603:10a6:203:91::32) by AM6PR08MB3175.eurprd08.prod.outlook.com
 (2603:10a6:209:3f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Fri, 8 May
 2020 09:01:37 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::a0) by AM5PR0502CA0022.outlook.office365.com
 (2603:10a6:203:91::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.31 via Frontend
 Transport; Fri, 8 May 2020 09:01:37 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Fri, 8 May 2020 09:01:36 +0000
Received: ("Tessian outbound b3a67fbfbb1f:v54"); Fri, 08 May 2020 09:01:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 82d581d071845031
X-CR-MTA-TID: 64aa7808
Received: from 2a6769f81aaf.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F7239C07-16C7-41B7-A317-DF91BAFF17BD.1;
	Fri, 08 May 2020 09:01:31 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2a6769f81aaf.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 08 May 2020 09:01:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/KCJsJ+W5JqLoiGMHdq7Iv4wUwjfBs6mXrlhHOBF16DJ9aBvy9Urn/EEnCA5VR8O1bzZDZOzGDnjHOBXjnh16HDCkP3JUnsR4ujOo+XeWqopCiDYKGoTeL1+OED7VHz9+QiITrIO//b5JaD8o9pdzhwVZfVtmicmctIvTBmPhdBVeLBQ8YsKx4CTIQvKHNsZceRGgQ8OjvATVkaPop+j1jYq2cgf+Am7kruBdPbiHqj5EqnCiZjp6Etj58MLsIUz/J7Omj3bt8nmXARmFuB9fYetqR7UfS4NTriNj+dKfrzcBFYr1YJTxkrM/QPdzXF9V6Tq7WqOwbtxwWyLs7xRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUZ9pas42bNgfvD3isCUhkOb8odC27g2JE78+x5lxcI=;
 b=ajvESDoOuWroq+aKF1/5ghY1UC8pFZMyozFJP77/3EhrN+7F8CE2iJJkpub3iWx4dGSlXCavwmHUhgMvLcUkgvLDa5AkrunpbmT9c4OIslrvHn4CeD+Encn5/ET6hVyRsBesIvMTDtwpYGYiOsULqBf4PwzonrGtse0W8JuecMQDADi45aVqPpbxZm6N1ys0uQw5aSl35W9rP74XuIuj2ejco1Ns1n1JC40vVrD5ZuNB+gbHirA9L5WCJHN1FaKS5bZJ5QkJt88TpECoL1nF7g+lVQZtHpA4gwx3zDSrNbjTMRf7Y6x/dtFk9eb2oNwKlWuKsv4u8IFe94ytJTQAEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUZ9pas42bNgfvD3isCUhkOb8odC27g2JE78+x5lxcI=;
 b=88SrL5QV2jArB0BBv0h1rvjrA/rTSEQjemtF05XMtO54pknPQfFkb+ynl0N7OQdu5C+QYLeeftl4Sro0XycfAqxAqwctE3Oq63MqkkSUfonIbfCe+koEIXWpllc2bl2x2cLX8OOjGdnInylXO/3JqWnX6ZN6dePwFAgQ8OLXvM8=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB4617.eurprd08.prod.outlook.com (2603:10a6:10:75::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Fri, 8 May
 2020 09:01:28 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Fri, 8 May 2020
 09:01:28 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] [arm-autonomy] arm-autonomy-host-image-minimal: Abort on copy fail
Thread-Topic: [meta-arm] [PATCH] [arm-autonomy]
 arm-autonomy-host-image-minimal: Abort on copy fail
Thread-Index: AQHWJGEo8dRp5WWLz0+oHl3+/cVnKKid5cIA
Date: Fri, 8 May 2020 09:01:28 +0000
Message-ID: <5BD712EA-C90A-4D50-936C-518FC8466D1B@arm.com>
References: <160CBAE6046C60BB.2169@lists.yoctoproject.org>
In-Reply-To: <160CBAE6046C60BB.2169@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c378f7a7-117a-443e-9fcc-08d7f32e69fb
x-ms-traffictypediagnostic: DB7PR08MB4617:|AM6PR08MB3175:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3175619DE2FBF2FAC17A207D9DA20@AM6PR08MB3175.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:132;OLM:132;
x-forefront-prvs: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 pxpd4USXU+/m1JasSPYjcyVT+8DXu5zbkfc8CHzmkJURCW+TCEBlfdbkNpIXKVesE4KhwmmAwU/VYroGaWVZxRkwreu3fNYEItOfo/F/mjr1HI9y0VDODfRWrv8YxGLKuajBcflWxNsKW+kBMS+nq12zrvax+aNTq7JNLevgDkCBJPqqWTN/lxEy99LK10RYQrSqwx7NWizWNhlDhI6ga8N9tWJuSmD6XHZtNcF894W3HZ0i7yvfngdcRzPw2B2zE8un9ll2dWuvDDAzqdyrXiZaNSxHrmyzYWXqzuGjjeZE7Lq/evrMLOHAxlLddK5lyEmLN5CVWlJEmtM1eegXCRCeDALY/gfMB/lM8jhYpO5462cMQos3NwcO+LZpDbpSX+c0kRnzYphFvFQz/57VP0b/ley1mVv/CeeXsjgmUo58woBDrCNqgrZ/dVJ8aUV3TDcjoMcZwwFhxlVhvak5dXeGPlWEf6Dm5z3aQnAGV+FfP3htH6DFfeAJ8nHsozKYgm7B5A1Qwmj2tA4kEKZeAn2loppIHgnnSUup7r6AHs32hQNN/vQxWnrcn4envjFyxt1uguZWL5h9W0ZRAO4ma5S0j/98nf/xsBfG889jm7M=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(33430700001)(86362001)(5660300002)(66446008)(33440700001)(8936002)(6916009)(66946007)(76116006)(64756008)(66556008)(4326008)(33656002)(478600001)(66476007)(8676002)(53546011)(2616005)(186003)(91956017)(6506007)(26005)(83310400001)(83320400001)(83290400001)(83280400001)(6486002)(966005)(6512007)(71200400001)(36756003)(2906002)(316002)(83300400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 lFffh8WbkP2VNtSpbcBerDdGTX/3cShA2HiKhrOzuiTLwgiNidNsFmxda7IGhySXBXhfvFhzD42a9Mr3qpJ9msHWWGZWVCF9itkra8jE5uKq/cUQ6+iXd/ujcjxCph6ntSXJYLR3A5JIIhmJeozQluwZzBspomi5brQLncZdSTNi+dcGFimWgeefv0DIeEGJ6SgUaffrbEPpakvzNFk4sMgT/zNj1WOjWPF5h/xc5uYUAgBK8b39+7/m4esRK5TkkFqwdVZKPAIDvzR/HY5JxMpb8TbohnZOTv60zjz/un92CPe/AmTp1y64W1e9tEumuN8qSYfe/Oh+Eu+peCWVQ+hiBvhY1sKoPmapHe5Qfo/28AABg2AIr+Vbbhm2XbsuCu0mCJ5toXDUgbmHVoY85Fb2sK5l3EeA+MA7M7g2eNnwWD5ZoHpZ+auXyMPqrARA1Ui6RM24ArkQBHGD4EQgaWaTnPbrfpOEbDobEsSvWFtkeSM8r3QKo2zQ+1yyi6gW
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4617
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(46966005)(33430700001)(6506007)(6512007)(70206006)(356005)(336012)(478600001)(81166007)(82740400003)(26005)(86362001)(4326008)(53546011)(316002)(8936002)(33440700001)(47076004)(82310400002)(2616005)(186003)(8676002)(70586007)(6486002)(6916009)(966005)(33656002)(2906002)(36756003)(36906005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	075697d9-7daf-48e2-73d6-08d7f32e6537
X-Forefront-PRVS: 039735BC4E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tHYcWeaeg6tv9uJ+o/O40C5W1SGtsTQ006GPmVmftrBlujo6cq+CvyUAda6uR7tl0yZj5lpJX4WEPlgwXK95c7vPh5KDgxhKRYieqBhkWfm/RuOhgQFVd0npNzVZpsFIgRPy1g68uhLNMmbsWS2RDMD+ZTmSzSzJRzASK1poKazOrJQHShhQfPEJVNe13MkHIrDoBORmKUVCuvTqoDOGE2RWahWuWE+Lzf8BZpPW7LU5mb7i0IHl9kWZsdLZ5cUetYAzbJWv3TR36NHD8Q0gobj3uRIEcY1hnYe5wbxPxWfTJb/w81Fk1vYcvVp2rj0JzHWR64dueop7+GNr2jfbE1eczhps6iUFnK0+xH7ZziOUvTAtBjAChk37Uo6BMLZMvUG8jEOIPDLv6KuDNKluYCcrytHlUG0ZQdpWKBG+EcXol1rM/qHnfLVVj3LzgfHhkBvuPvKW0ZvnN1AF6vZZjGx2wHUYVvhlnKp2yquZG16V2KpwCv/mjblXcR6NPVgQ8TEGbJB8FK3uTFSDxE67A8VJVMN0lL+zlonFKpmrnbCpNir2XqVFJE4GW20hdqEOhAYrbU/VOpnGh/4owpeo0oEFghG3zp++EH7CvJARTHStTQ4rooe4CIB/i7iQZ8Sn7v05ZpdXjD1mBgemvfjleg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 09:01:36.7318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c378f7a7-117a-443e-9fcc-08d7f32e69fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3175
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E77B9158A5E8FE4B8D4FDB4B575CEFF1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 7 May 2020, at 12:17, Bertrand Marquis via lists.yoctoproject.org <be=
rtrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> From: Diego Sueiro <diego.sueiro@arm.com>
>=20
> If the guest image copy fails we need to abort the do_image execution.
>=20
> Change-Id: I3785a0828e271ed27eb7f9212804b5b9b39f79ac
> Issue-Id: SCM-990
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> .../recipes-core/images/arm-autonomy-host-image-minimal.bb     | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-ima=
ge-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-ima=
ge-minimal.bb
> index 3859f52..5b20fa0 100644
> --- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-mini=
mal.bb
> +++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-mini=
mal.bb
> @@ -112,7 +112,8 @@ python add_extern_guests () {
>             # Add file extension if not there
>             if not dstname.endswith('.xenguest'):
>                 dstname +=3D '.xenguest'
> -            bb.utils.copyfile(path, guestdir + '/' + dstname)
> +            if not bb.utils.copyfile(path, guestdir + '/' + dstname):
> +                bb.fatal("Fail to copy Guest file " + path)
> }
>=20
> IMAGE_PREPROCESS_COMMAND +=3D "add_extern_guests; "
> --=20
> 2.17.1
>=20
>=20

