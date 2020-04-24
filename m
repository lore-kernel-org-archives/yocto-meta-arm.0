Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.41])
 by mx.groups.io with SMTP id smtpd.web11.1429.1587714310211112669
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Apr 2020 00:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=H10KLY4y;
 spf=pass (domain: arm.com, ip: 40.107.13.41, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJuESmHLqCp/6MuBFjwd8gUHRNiJD0A3G3R1Wv5tu7o=;
 b=H10KLY4yM80oWJCgSauLImvBl0Ka9Aat5mXf0dd2NgRHC3XmN6eCLDX4+cNvz020kzZXkXsn6NHFejy4+bd2Hwy8ixveF28sjEjhTQ0vWslnrr3kX2Ztyw22EcxNB+n07EqneCu+YXYXaxG28AwHYHinD+FaBB5wTvGUN8GAO38=
Received: from DB7PR05CA0057.eurprd05.prod.outlook.com (2603:10a6:10:2e::34)
 by VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Fri, 24 Apr
 2020 07:45:07 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::e8) by DB7PR05CA0057.outlook.office365.com
 (2603:10a6:10:2e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Fri, 24 Apr 2020 07:45:07 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.19 via Frontend Transport; Fri, 24 Apr 2020 07:45:07 +0000
Received: ("Tessian outbound d63670e9da8f:v53"); Fri, 24 Apr 2020 07:45:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3a53a1a794b4cdf2
X-CR-MTA-TID: 64aa7808
Received: from 3c8be7b6bb35.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 064165D3-94D1-46A3-AECD-33FDFFC7BA77.1;
	Fri, 24 Apr 2020 07:45:01 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3c8be7b6bb35.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 24 Apr 2020 07:45:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEA6S2BoMjSdQ1YYfvcrAYT2fmi/NSI1GLOiC9uTBI+plmXOFVwsr9J0ojgsZKN5BRyJ8pOt6OzIb+GgNaVExHAGGqigEYqEi+lLPMFilspwOW4qJ7bu3V4odtafzjONUelLSSc5LndbxplhOi5u/qH2saW0mhwzETPKyR5bY2QLEPSXA7PXcQTHoG/hWVNJw2/rHhWHvpyNo5LgYyfILTn//XK743+40stxtSONlr/o3B0bysVz1MNbO0WtzCS+AUAafHcS69Z0WaYWT0w332KQQeTSAX4z2ljEqwkjCI6BUkiqTqrKWcmVYPKZwYXuKBarAPhA9SwEuUg8bVhOug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJuESmHLqCp/6MuBFjwd8gUHRNiJD0A3G3R1Wv5tu7o=;
 b=fh1wwOJspx24ukC0GGkvodGDxEzTFKHy3fILIikvfro2+IGeC9FT1vNSQ6vhhs33ASOldpjmXyIa9pJIZID9SV8aHkazXNFMrjNjvAw5N95p2aOc+CPm4CtlZXWug4uyEkUquYpHLq9qeEu82hK0OIyQ9QN9mZoQ3fXI0Edu4Nrv+EJoS8e8/k3dJOyUk+B3Tnnf0eCyMAZSTn8dtFj4V3WjsOZ2rn5MXRENV94A41CRnfUsI9z1YY0JOUQQ6AlvXRiQOD/7V2gK3/WBkUCVij/SYudVJW+QKlL+Etnwg18TVImHgdjYMrVKtOVcEMOJ2umeHUsgSfmuu+kJ7IeOsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJuESmHLqCp/6MuBFjwd8gUHRNiJD0A3G3R1Wv5tu7o=;
 b=H10KLY4yM80oWJCgSauLImvBl0Ka9Aat5mXf0dd2NgRHC3XmN6eCLDX4+cNvz020kzZXkXsn6NHFejy4+bd2Hwy8ixveF28sjEjhTQ0vWslnrr3kX2Ztyw22EcxNB+n07EqneCu+YXYXaxG28AwHYHinD+FaBB5wTvGUN8GAO38=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3177.eurprd08.prod.outlook.com (2603:10a6:5:26::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Fri, 24 Apr
 2020 07:45:00 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2921.030; Fri, 24 Apr 2020
 07:45:00 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy: add compatibility to dunfell
Thread-Topic: [meta-arm] [PATCH] arm-autonomy: add compatibility to dunfell
Thread-Index: AQHWGgSOB4qIGGgWTEKY4Eytbas62qiH1cgAgAAOs4A=
Date: Fri, 24 Apr 2020 07:45:00 +0000
Message-ID: <69C72C7D-DE19-4122-ADE0-1E6C72E1C121@arm.com>
References: <20200424064921.30088-1-vineeth.raveendran@arm.com>
 <AM0PR08MB3987B3F7ED4DD83D1BEEE65992D00@AM0PR08MB3987.eurprd08.prod.outlook.com>
In-Reply-To: 
 <AM0PR08MB3987B3F7ED4DD83D1BEEE65992D00@AM0PR08MB3987.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 823a8a7d-7550-4717-b0b9-08d7e823688d
x-ms-traffictypediagnostic: DB7PR08MB3177:|VI1PR08MB5503:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB5503A2D98735DA745F3537849DD00@VI1PR08MB5503.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 03838E948C
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(2616005)(6486002)(186003)(66946007)(76116006)(5660300002)(66556008)(66476007)(64756008)(66446008)(26005)(91956017)(966005)(86362001)(36756003)(478600001)(6916009)(81156014)(8676002)(8936002)(6506007)(316002)(53546011)(6512007)(4326008)(71200400001)(2906002)(33656002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 swUHgv7GhYHoI18aTzrJPBYcRCVBMGealJHs6K3lLXrAdZMMlkdkefd0em+KrlXaoV0gC0D3HY5OdLCk51C3NFOVqynoTEzfbGNHXjXHpLInb9khWrQ4o3Q/kHKp0T3+MrsrbrntZ7oUu+BINiojNdPi4j6i9FB+csSc5NsmjmbUZlyifjrQLXRwa6xo5j4JMLrh83jOUahIW/pPylk8fkhFfOyODGTp9NmniFRIH/SoKZ99iqmT6JCa9rr48ATH0TDCa7Egn2JP/baiD3DYGKfn11/uAfQUSKjxd78PbPwE/PR92F7L5jFHUoa/AYZV6ISosjGyrgmPVHYBEjtEuckZ2QoCgajaoM9CNnZiYOtuo9BHqJ94QLb4g2wuKYTVlFjNq/cCQMBMwpu622BYhN1dK9MupJ32rQB/w1Sj1cVzDhjDK9w5yUR43NV4nkJcice0TfKRXKq+Htzf0zfTFeN92iaq979726p6ALdD1L8rOnFN58lmV2Ej+c6xaqD/wiSEuNj9ReDE7pFa/U1DZg==
x-ms-exchange-antispam-messagedata: 
 gh3zCGptXZnEn/aivVYXk66p0ChAqVPg22TcruFlsJSyd9JHpeSxsAu/M2NV3tYfz8n0QhoBwDHgNSHM2tdqV0Q41kEEeCu8aRtQfgqHZxbLbVRiHBbOAZ88Q5x1fBhN6msVoBSSTongKgHWQYn7WQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3177
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(46966005)(70206006)(81166007)(336012)(478600001)(82310400002)(82740400003)(6512007)(86362001)(2906002)(356005)(47076004)(4326008)(33656002)(2616005)(966005)(6916009)(186003)(53546011)(26005)(81156014)(36756003)(70586007)(8676002)(6506007)(5660300002)(8936002)(6486002)(316002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e14a5a30-3730-471e-5562-08d7e82364bb
X-Forefront-PRVS: 03838E948C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9AJadz21e9gaJ+rZcrlRToY50Dt5ysPmj/4EmhiHxuXfI2EVLO6QyFkCxdYzHCfl+fYw6nwPzRZNwngUYgWG934SeujUpzCcxSCIFjr8jICxgWkNG7GSont9A3RbU2CwthSR17LxlCrg/bXf/8fj9KHppA96qSvFj5yJf6EarEDVFDi2kwAgQ9NtczPK4KtrhvU2I99W2Cg9t8b44eQeqthPYmE6/3t9ig3BEtye2+LT81n/+Xhy1QUueP7ogtHJDuOiN+ffjyaAOXAEV8+h3uJ6usApQ/pPcnjX8hVtQWNhnTcnidUK5c09QFRBgten84JJ1qTcvlsvhM308D5ke8rNWAa7XGUNnG6Nw2raDI6bspn9rbK27MM1CxSIOsRw99npzrNURfNf34Ogl5C3etZfLQ38b7BVszRwtHIfFj+TM3usNAbXqBWYBfq8gnROJRFb4FLpKiETCkZHSVZ+gvh7tbNd4FnNIMRBB+ov0MmKTU7DkvstwS8iMarh/cmcOAit62Uh+ekDDgNSI1fBWTmfGxgwm/hoo9NfbG2aYb2XX5Jmi4ISekTGxE7yj744/kz6vxmR9UzQElBok/U5lg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2020 07:45:07.1765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 823a8a7d-7550-4717-b0b9-08d7e823688d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5503
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <10ECEA61565C3748ABF7A37E999326CF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 24 Apr 2020, at 07:52, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
>> -----Original Message-----
>> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
>> On Behalf Of Vineeth Raveendran via lists.yoctoproject.org
>> Sent: 24 April 2020 07:49
>> To: meta-arm@lists.yoctoproject.org
>> Cc: nd <nd@arm.com>
>> Subject: [meta-arm] [PATCH] arm-autonomy: add compatibility to dunfell
>>=20
>>    - Remove xen-base from image as it's included via
>>      xenguest-manager rdepends
>>    - Use xen-tools in xenguest-manager rdepends for the required
>>      xen tools and use xen-base only for zeus as it was changed
>>      in meta-virtualization.
>>    - Move xen bbappend as recipe was renamed in meta-virtualization.
>>=20
>> Change-Id: I439bde0df2c0a16f529436b65f1a96af5a2981af
>> Issue-Id: SCM-833
>> Signed-off-by: Vineeth Raveendran <vineeth.raveendran@arm.com>
>=20
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

>=20
>> ---
>> meta-arm-autonomy/conf/layer.conf                            | 2 +-
>> .../recipes-core/images/arm-autonomy-host-image-minimal.bb   | 1 -
>> .../xen/{xen_4.%.bbappend =3D> xen_%.bbappend}                 | 0
>> .../recipes-extended/xenguest/xenguest-manager.bb            | 5 ++++-
>> 4 files changed, 5 insertions(+), 3 deletions(-)  rename meta-arm-
>> autonomy/recipes-extended/xen/{xen_4.%.bbappend =3D> xen_%.bbappend}
>> (100%)
>>=20
>> diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-
>> autonomy/conf/layer.conf
>> index 19f24ad..de79bdf 100644
>> --- a/meta-arm-autonomy/conf/layer.conf
>> +++ b/meta-arm-autonomy/conf/layer.conf
>> @@ -16,7 +16,7 @@ LAYERDEPENDS_meta-arm-autonomy =3D " \
>>    openembedded-layer \
>>    virtualization-layer \
>> "
>> -LAYERSERIES_COMPAT_meta-arm-autonomy =3D "zeus"
>> +LAYERSERIES_COMPAT_meta-arm-autonomy =3D "zeus dunfell"
>>=20
>> # We don't activate virtualization feature from meta-virtualization as =
it  #
>> brings in lots of stuff we don't need. We need to disable the sanity ch=
eck diff
>> --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-
>> image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-
>> autonomy-host-image-minimal.bb
>> index 978b58f..727abf2 100644
>> --- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-
>> minimal.bb
>> +++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-
>> image-mini
>> +++ mal.bb
>> @@ -39,7 +39,6 @@ IMAGE_INSTALL +=3D " \
>>     packagegroup-core-boot \
>>     packagegroup-core-ssh-openssh \
>>     kernel-modules \
>> -    xen-base \
>>     qemu \
>>     xenguest-manager \
>>     xenguest-network-bridge \
>> diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_4.%.bbappend
>> b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
>> similarity index 100%
>> rename from meta-arm-autonomy/recipes-
>> extended/xen/xen_4.%.bbappend
>> rename to meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
>> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-
>> manager.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-
>> manager.bb
>> index 9affae9..2e040a8 100644
>> --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
>> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-
>> manager.bb
>> @@ -46,7 +46,10 @@ do_install() {
>> }
>>=20
>> # Things that we need on the target
>> -RDEPENDS_${PN} +=3D "bash tar xenguest-mkimage lvm2 xen-xl parted
>> e2fsprogs"
>> +RDEPENDS_${PN} +=3D "bash tar xenguest-mkimage lvm2 parted e2fsprogs"
>> +
>> +# Extend RDEPENDS based on the yocto version we are running against
>> +RDEPENDS_${PN} +=3D "${@bb.utils.contains('LAYERSERIES_CORENAMES',
>> 'zeus', 'xen-base', 'xen-tools', d)}"
>>=20
>> FILES_${PN} +=3D "${bindir}/xenguest-manager \
>>                ${sysconfdir}/xenguest"
>> --
>> 2.17.1
>=20
>=20

