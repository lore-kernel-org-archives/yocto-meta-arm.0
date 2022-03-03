Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D663C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 10:55:54 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.72])
 by mx.groups.io with SMTP id smtpd.web08.9457.1646304951750566374
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 02:55:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=I7o3x5Dl;
 spf=pass (domain: arm.com, ip: 40.107.7.72,
 mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O24BGQCBXSek+9WNhE0e+70LIr7xGWGtOW0zrFeALiQ=;
 b=I7o3x5DlwbwsmiVXuVSob+qftLwHGkBzOWq2yjdtncVwS94VcA3fTozPhn3+TYOMy+zhrZI9KHJ7fWNP5w9OBfKUUFXEN5jjWTCzEtHMjtdDhCsbYfmjCj0ojRzgVq6e0vVO41f/BHvPlvqBle7jt1T+/1aSzmmAMxSHuLd2wHQ=
Received: from AS9PR07CA0027.eurprd07.prod.outlook.com (2603:10a6:20b:46c::29)
 by PAXPR08MB7171.eurprd08.prod.outlook.com (2603:10a6:102:209::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 10:55:45 +0000
Received: from AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46c:cafe::2) by AS9PR07CA0027.outlook.office365.com
 (2603:10a6:20b:46c::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.4 via Frontend
 Transport; Thu, 3 Mar 2022 10:55:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT045.mail.protection.outlook.com (10.152.17.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Thu, 3 Mar 2022 10:55:45 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Thu, 03 Mar 2022 10:55:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bd5a988bb587cf31
X-CR-MTA-TID: 64aa7808
Received: from a17f63a4fded.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 816E58FB-3D82-4E16-85F2-A0F4EAEB3B09.1;
	Thu, 03 Mar 2022 10:55:38 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 a17f63a4fded.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Mar 2022 10:55:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FM6X9uxqcuSYlff7AsL4L51ZwTmIdpwIjQZQzLxij39/q7dsiWwMekpcFj9V7gwJQ3aD3yGq0T2UxK6Pcz4S9W5ui7BFy6s7b2qAojoeUkN5Xzbj1+XrKlMoq8V4F4BVyO3uF0WrOblMXS/y6Y4h7879we3lVDvTUoUHNj9OVCm179PN05xJ042TySWdIJDqjS5CaId5oj390D0wGAwjaq7xtK6V/nQF7wCsE7bKH1paoJe+WxHrTgOKIGvtiBr9duaxYO5aUQ1ZNpg1q3i2AmhWyjnkGP8iglMBrC9Qdt2ny41M/AH0nb8TWksasG8evMyUFu2dn/jSP2Ta+41/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O24BGQCBXSek+9WNhE0e+70LIr7xGWGtOW0zrFeALiQ=;
 b=KhnTb5O5Y/hiXuWdByFjbxKjcxoyEh232F8030TgRRN0Ch4x8MzWGQpwvPaQPiw0Atrb30q4HRkO81LWio9RFCI/0BvJ6Ng3srcPr7eQBTO1gj1teJpVCi6YRESSBaw9kVRyQ8jcncCpwAoyndTSKJr10whfi+or2eKOHrmajaEdFXWSBVS772WbTy2pl90iIr1DpHI2kQ/BCotCZqydIPLFU4A0DbmGI464iod0w2KaLVvN/Uoz5FhpFpm8INPHhKXFtbqZKLTLfEIvSZXBbVJgEaRGG4IgIg253W5ntWJSlMCMvDQO9rnMTuqJwhvirxUqNhxP1hCpsYX1GsAgug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O24BGQCBXSek+9WNhE0e+70LIr7xGWGtOW0zrFeALiQ=;
 b=I7o3x5DlwbwsmiVXuVSob+qftLwHGkBzOWq2yjdtncVwS94VcA3fTozPhn3+TYOMy+zhrZI9KHJ7fWNP5w9OBfKUUFXEN5jjWTCzEtHMjtdDhCsbYfmjCj0ojRzgVq6e0vVO41f/BHvPlvqBle7jt1T+/1aSzmmAMxSHuLd2wHQ=
Received: from AM5PR0801MB1716.eurprd08.prod.outlook.com
 (2603:10a6:203:39::18) by AM6PR08MB3191.eurprd08.prod.outlook.com
 (2603:10a6:209:41::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 10:55:36 +0000
Received: from AM5PR0801MB1716.eurprd08.prod.outlook.com
 ([fe80::a43f:bc38:e76e:2b34]) by AM5PR0801MB1716.eurprd08.prod.outlook.com
 ([fe80::a43f:bc38:e76e:2b34%12]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 10:55:36 +0000
From: Abdellatif El Khlifi <Abdellatif.ElKhlifi@arm.com>
To: Sumit Garg <sumit.garg@linaro.org>, Jon Mason <jdmason@kudzu.us>,
	Alejandro Hernandez <alhe@linux.microsoft.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Vishnu Banavath <Vishnu.Banavath@arm.com>, Maxim Uvarov
	<maxim.uvarov@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, Denys
 Dmytriyenko <denis@denix.org>, Drew Reed <Drew.Reed@arm.com>
Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
Thread-Topic: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
Thread-Index: AQHYLkR2cO31jWkCZkuCqK1e0SZv1qytIzOAgABXUG0=
Date: Thu, 3 Mar 2022 10:55:35 +0000
Message-ID: 
 <AM5PR0801MB17164CCA6910A06008AF914AFD049@AM5PR0801MB1716.eurprd08.prod.outlook.com>
References: <20220226030441.2301940-1-alhe@linux.microsoft.com>
 <Yh5JYWMmAd6SnmOS@kudzu.us>
 <73a2bdd2-c8d1-9d96-df50-044d76bd4ff7@linux.microsoft.com>
 <Yh+DX8uaoS1VPpQ8@kudzu.us>
 <CAFA6WYMC1m18G_PaN07KTuavD3=8RYS4RoTUxGSiOsyePfZH1g@mail.gmail.com>
In-Reply-To: 
 <CAFA6WYMC1m18G_PaN07KTuavD3=8RYS4RoTUxGSiOsyePfZH1g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: cb0aaf41-c027-84a7-21f6-3e0ca59eb59a
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 82ca72ee-9138-4f53-7971-08d9fd045e3d
x-ms-traffictypediagnostic: 
	AM6PR08MB3191:EE_|AM5EUR03FT045:EE_|PAXPR08MB7171:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB7171CD47E288F5C5AF6E9262FD049@PAXPR08MB7171.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 C4cGB+6uJKcnBTEheuMJjFRXL2PyCnak112BjHsDVKKPF1XqWQkVWF2BJcLPzyNh9Qjto/qI20t8VPLgl3tW13DGZVApYY8IxLyrsCXyl3Ln0eN8pSLh5STgg27s+gN4cR0Lt1mCKtEoKygPiURMlMys44tjcQITanLW/eWHYxWYxmBGo/kjUj5Jt0cZWGM0hEbp1iR4o698ee/aBBzEdZuOTTFgF38OMGeIfF7IuGgzWA2n0beaHC5I//VC9ZGsaXh4qx0hPlVPn4IGq+UeIcTdESCDoqjb+WLzsjW+K2A48ZQzg53+0l7MBlLlq/c5mWmC70T0mdRdtJqH07tLTYhUkPyx95snmJ8qgswKtID8DdpU1Wk3KLloN1CUSkQ5LZof1lPj3M1/GIH3YoKPkDkIWqeL1fDzNAIEpiXD5m9Aw9ON/Ij5J7ScDe5zMitKtihnf1f0/gCyHMt08SbvrvEoiJrMAOYhj+A2gy5md7mnhkJ98tFSTSnsDWUkFGbV6vKdQOlApZ9gTja0uhS35rpLSNf3s/Sb25E1Ou3aZ3zUBrumiQi/PPBeLa4EUY0MZKlbAsUziqr8WnMEyyqXamgth6QvF85536xqguWakkxC/58Fl8gduPz4M1fMSc8azNfSWZVifwWDbiL4AAq4y6vvOhB+5RFEKMTU9mf7arYwpDm6JDRddmsXxktGr5kYPWAIFGvO/2dbVR+I/5WxsLZHeoRkVtuT9LZ0HCEA4JspddGqgIOB35jPh9t/cTuZpiz4iwc6qtnzPp6lHPfeOUySA4cqJ3KSvG7kTSATi+7G7lzAjwduc9AEvV04wmQLImWsiUlDCVu2fWKdoA1C8Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB1716.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(66556008)(38070700005)(508600001)(86362001)(8676002)(66946007)(66446008)(76116006)(64756008)(38100700002)(66476007)(52536014)(91956017)(122000001)(316002)(166002)(55016003)(54906003)(110136005)(966005)(53546011)(9686003)(186003)(7696005)(26005)(6506007)(19627405001)(2906002)(33656002)(5660300002)(8936002)(30864003)(83380400001)(4326008)(579004);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AM5PR0801MB17164CCA6910A06008AF914AFD049AM5PR0801MB1716_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3191
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	803e7a78-de4b-44a0-dd60-08d9fd0458c4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a+fJnrMON2WYzgvRe/CXzCpjScKl+ijih1oHF4qvK0aU2v5X3mhTlfLsTJVH0o1MvlIRQETQStctvxuW3nk7P+2gbRJdKtf8NgFjS3oJln8tivOQc1oNTVpWLyRZR96KtRxEjL2skCKdW75atfjaJdUR8NRvPXKaAGYAeMetxgjxMTZto+r+q0Dph4bmGhRSEVVh+998Rgfg1np4GEI3kF59l1BgznQ9RWfvzDbqJBAT3aPOnuDbxut0TTcp9Ma84U29ifzxsUNM+ub0Ry8hSrSly7tvsZWQbm2ECWZrG3xCbvjQg67BOCc7QSNVK/yEVRLInVOuSaC26l6W/eEf01uc4SS01GtXly2VmxOeG2GKO8GqHirjpDPpJhql1pg9+RWnZTUKE8kF+MqfZQ39J1zNstq5OCKrPCpdWYsHbkHmpVEgsLBNtIZJyCEtpwjUe26OvMkPYim/p6jVYyDjKqUBTf09tPU9Xm9TeXy+fjJRGw1e2hA9P7IunI76pI/YCOQBXuEkD7qE2WiDLvDHMlmfLOKjq2eb5deFO+bzLuCxmwUnAEqSGaDD0XvK4sZXJTssdAtxHAhHbSUBpHTsESK2+vs5XCXydL9vuIQrysh/sW8YANEsc01p27zgEhJrjXb+2X2zygNrVIeBF62qLlbfCnOQD7si8zVEBQYF8PGBhqOwoDG7eEudtWuiXAuA039bmQb6MURHMwp4j2M9LXvh8rgbtcrHap9EpxoWt6xayxzib4nOgGvLbn6LV/UV9b9K0G+IO0wbATV0A1Af6thxXy92MfdMtZ50nnxewjI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(40460700003)(86362001)(54906003)(508600001)(316002)(110136005)(81166007)(356005)(7696005)(166002)(8936002)(55016003)(52536014)(6506007)(36860700001)(336012)(47076005)(53546011)(30864003)(33656002)(19627405001)(70586007)(70206006)(966005)(4326008)(8676002)(9686003)(2906002)(186003)(26005)(82310400004)(83380400001)(5660300002)(559001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:55:45.1481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 82ca72ee-9138-4f53-7971-08d9fd045e3d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7171
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Mar 2022 10:55:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3096

--_000_AM5PR0801MB17164CCA6910A06008AF914AFD049AM5PR0801MB1716_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I suggest the following:

In meta-arm-bsp/conf/layer.conf add :

LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot =3D " meta-python ope=
nembedded-layer"

In ci/qemuarm64-secureboot.yml add:

ci/meta-openembedded.yml

Kind regards
________________________________
From: Sumit Garg <sumit.garg@linaro.org>
Sent: 03 March 2022 05:31
To: Jon Mason <jdmason@kudzu.us>; Alejandro Hernandez <alhe@linux.microsoft=
.com>
Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>; Vish=
nu Banavath <Vishnu.Banavath@arm.com>; Maxim Uvarov <maxim.uvarov@linaro.or=
g>; Peter Griffin <peter.griffin@linaro.org>; Denys Dmytriyenko <denis@deni=
x.org>; Drew Reed <Drew.Reed@arm.com>; Abdellatif El Khlifi <Abdellatif.ElK=
hlifi@arm.com>
Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16

On Wed, 2 Mar 2022 at 20:16, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Tue, Mar 01, 2022 at 09:54:04PM +0000, Alejandro Hernandez wrote:
> > Hi John,
> >
> > On 3/1/22 16:27, Jon Mason wrote:
> > > On Fri, Feb 25, 2022 at 08:04:41PM -0700, Alejandro Enedino Hernandez=
 Samaniego wrote:
> > > > - Removes upstreamed patches for optee-examples
> > > > - Fixes optee-examples installation
> > > > - Includes new python3-cryptography dependency
> > > > - Fixes python3-cryptography to work with openssl
> > > >
> > > > Tested on qemuarm64-secureboot via optee-examples xtest -l 15
> > > With the new changes in python3-crypto, this is no longer working.
> > > I'm seeing the following error in CI.
> > >
> > > --- Error summary ---
> > > ERROR: Nothing PROVIDES 'python3-cryptography-native' (but /builds/jo=
nmason00/meta-arm/meta-arm/recipes-security/optee/optee-os_3.16.0.bb DEPEND=
S on or otherwise requires it). Close matches:
> > >    python3-cython-native
> > >    python3-pycryptodome-native
> > >    python3-typogrify-native
> > >
> > > I _think_ that adding meta-openembedded.yml being adding to the
> > > machines should fix it, but I'm not sure that is the right solution.
> > >
> > > Thanks,
> > > Jon
> >
> > My apologies, I was testing with meta-oe/meta-python enabled hence I di=
dnt
> > see the error before.
> >
> >
> > I'm not sure its the right solution either, this dependency is coming f=
rom
> > the pem_to_pub_c.py script which is now using python3-cyrptography sinc=
e
> > commit https://github.com/OP-TEE/optee_os/commit/169eac19852d98d8ade821=
f913bbdd76faf52823
> > (this also means we could remove python3-cryptodome from the dependenci=
es as
> > well), as far as I can tell this creates a hard dependency, passing
> > EXTRA_OEMAKE +=3D " CFG_WITH_USER_TA=3Dn" would avoid executing the scr=
ipt
> > completely but I also dont think thats what we want.
> >
> > Should we include meta-openembedded.yml?,  or what other choice do we h=
ave?
> > create a python3-cyrptography recipe to meta-arm?, thoughts?

Yes, we should include meta-openembedded.yml as a dependency and
remove python3-cryptodome from the dependencies.

-Sumit

>
> OPTEE isn't an area I understand well (to know whether removing this
> is superior to adding the dependency in the files).  So, I'm directly
> cc'ing contributors that I think will have an opinion to this
> response.
>
> Thanks,
> Jon
>
> >
> > Cheers,
> >
> > Alejandro
> >
> > > > Signed-off-by: Alejandro Enedino Hernandez Samaniego<alhe@linux.mic=
rosoft.com>
> > > > ---
> > > >   ....bbappend =3D> optee-client_3.16.0.bbappend} |  0
> > > >   ...pend =3D> optee-os-tadevkit_3.16.0.bbappend} |  0
> > > >   ...14.0.bbappend =3D> optee-os_3.16.0.bbappend} |  0
> > > >   ....0.bbappend =3D> optee-test_3.16.0.bbappend} |  0
> > > >   .../optee-ftpm/optee-ftpm_git.bb              |  8 +-
> > > >   .../optee/optee-client_3.14.0.bb              |  3 -
> > > >   .../optee/optee-client_3.16.0.bb              |  3 +
> > > >   .../recipes-security/optee/optee-examples.inc |  7 +-
> > > >   ...ix-non-portable-sh-check-for-plugins.patch | 46 ++++++++++
> > > >   ...efault-cross-compiler-environment-se.patch | 84 --------------=
-----
> > > >   ...nable-plugins-installation-in-rootfs.patch | 37 --------
> > > >   .../optee/optee-examples_3.14.0.bb            |  4 -
> > > >   .../optee/optee-examples_3.16.0.bb            |  3 +
> > > >   ..._3.14.0.bb =3D> optee-os-tadevkit_3.16.0.bb} |  3 +-
> > > >   meta-arm/recipes-security/optee/optee-os.inc  |  2 +-
> > > >   ...{optee-os_3.14.0.bb =3D> optee-os_3.16.0.bb} |  2 +-
> > > >   .../recipes-security/optee/optee-test.inc     |  2 +-
> > > >   .../optee/optee-test_3.14.0.bb                |  3 -
> > > >   .../optee/optee-test_3.16.0.bb                |  3 +
> > > >   meta-arm/recipes-security/optee/optee.inc     |  3 +
> > > >   20 files changed, 73 insertions(+), 140 deletions(-)
> > > >   rename meta-arm-bsp/recipes-security/optee/{optee-client_3.14.0.b=
bappend =3D> optee-client_3.16.0.bbappend} (100%)
> > > >   rename meta-arm-bsp/recipes-security/optee/{optee-os-tadevkit_3.1=
4.0.bbappend =3D> optee-os-tadevkit_3.16.0.bbappend} (100%)
> > > >   rename meta-arm-bsp/recipes-security/optee/{optee-os_3.14.0.bbapp=
end =3D> optee-os_3.16.0.bbappend} (100%)
> > > >   rename meta-arm-bsp/recipes-security/optee/{optee-test_3.14.0.bba=
ppend =3D> optee-test_3.16.0.bbappend} (100%)
> > > >   delete mode 100644 meta-arm/recipes-security/optee/optee-client_3=
.14.0.bb
> > > >   create mode 100644 meta-arm/recipes-security/optee/optee-client_3=
.16.0.bb
> > > >   create mode 100644 meta-arm/recipes-security/optee/optee-examples=
/0001-Makefile-Fix-non-portable-sh-check-for-plugins.patch
> > > >   delete mode 100644 meta-arm/recipes-security/optee/optee-examples=
/0001-plugins-Honour-default-cross-compiler-environment-se.patch
> > > >   delete mode 100644 meta-arm/recipes-security/optee/optee-examples=
/0002-Makefile-Enable-plugins-installation-in-rootfs.patch
> > > >   delete mode 100644 meta-arm/recipes-security/optee/optee-examples=
_3.14.0.bb
> > > >   create mode 100644 meta-arm/recipes-security/optee/optee-examples=
_3.16.0.bb
> > > >   rename meta-arm/recipes-security/optee/{optee-os-tadevkit_3.14.0.=
bb =3D> optee-os-tadevkit_3.16.0.bb} (94%)
> > > >   rename meta-arm/recipes-security/optee/{optee-os_3.14.0.bb =3D> o=
ptee-os_3.16.0.bb} (76%)
> > > >   delete mode 100644 meta-arm/recipes-security/optee/optee-test_3.1=
4.0.bb
> > > >   create mode 100644 meta-arm/recipes-security/optee/optee-test_3.1=
6.0.bb
> > > >
> > > > diff --git a/meta-arm-bsp/recipes-security/optee/optee-client_3.14.=
0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-client_3.16.0.bbappe=
nd
> > > > similarity index 100%
> > > > rename from meta-arm-bsp/recipes-security/optee/optee-client_3.14.0=
.bbappend
> > > > rename to meta-arm-bsp/recipes-security/optee/optee-client_3.16.0.b=
bappend
> > > > diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_=
3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.1=
6.0.bbappend
> > > > similarity index 100%
> > > > rename from meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3=
.14.0.bbappend
> > > > rename to meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.1=
6.0.bbappend
> > > > diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bb=
append b/meta-arm-bsp/recipes-security/optee/optee-os_3.16.0.bbappend
> > > > similarity index 100%
> > > > rename from meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bba=
ppend
> > > > rename to meta-arm-bsp/recipes-security/optee/optee-os_3.16.0.bbapp=
end
> > > > diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.=
bbappend b/meta-arm-bsp/recipes-security/optee/optee-test_3.16.0.bbappend
> > > > similarity index 100%
> > > > rename from meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.b=
bappend
> > > > rename to meta-arm-bsp/recipes-security/optee/optee-test_3.16.0.bba=
ppend
> > > > diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb=
 b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> > > > index f2a74da..0eb64cd 100644
> > > > --- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> > > > +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> > > > @@ -15,7 +15,9 @@ inherit deploy python3native
> > > >   LICENSE =3D "MIT"
> > > >   LIC_FILES_CHKSUM =3D"file://${S}/LICENSE;md5=3D27e94c0280987ab296=
b0b8dd02ab9fe5"
> > > > -DEPENDS =3D "python3-pycryptodome-native python3-pycryptodomex-nat=
ive python3-pyelftools-native optee-os-tadevkit"
> > > > +DEPENDS =3D "python3-pycryptodome-native python3-pycryptodomex-nat=
ive python3-pyelftools-native optee-os-tadevkit \
> > > > +    python3-cryptography-native \
> > > > +    "
> > > >   FTPM_UUID=3D"bc50d971-d4c9-42c4-82cb-343fb7f37896"
> > > > @@ -48,6 +50,10 @@ EXTRA_OEMAKE:append:aarch64:qemuall =3D "\
> > > >       CFG_ARM64_ta_arm64=3Dy \
> > > >   "
> > > > +# python3-cryptography needs the legacy provider, so set OPENSSL_M=
ODULES to the
> > > > +# right path until this is relocated automatically.
> > > > +export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"
> > > > +
> > > >   PARALLEL_MAKE =3D ""
> > > >   do_compile() {
> > > > diff --git a/meta-arm/recipes-security/optee/optee-client_3.14.0.bb=
 b/meta-arm/recipes-security/optee/optee-client_3.14.0.bb
> > > > deleted file mode 100644
> > > > index be78b88..0000000
> > > > --- a/meta-arm/recipes-security/optee/optee-client_3.14.0.bb
> > > > +++ /dev/null
> > > > @@ -1,3 +0,0 @@
> > > > -require optee-client.inc
> > > > -
> > > > -SRCREV =3D "06e1b32f6a7028e039c625b07cfc25fda0c17d53"
> > > > diff --git a/meta-arm/recipes-security/optee/optee-client_3.16.0.bb=
 b/meta-arm/recipes-security/optee/optee-client_3.16.0.bb
> > > > new file mode 100644
> > > > index 0000000..4a36cbc
> > > > --- /dev/null
> > > > +++ b/meta-arm/recipes-security/optee/optee-client_3.16.0.bb
> > > > @@ -0,0 +1,3 @@
> > > > +require optee-client.inc
> > > > +
> > > > +SRCREV =3D "06db73b3f3fdb8d23eceaedbc46c49c0b45fd1e2"
> > > > diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/m=
eta-arm/recipes-security/optee/optee-examples.inc
> > > > index 656722e..097f892 100644
> > > > --- a/meta-arm/recipes-security/optee/optee-examples.inc
> > > > +++ b/meta-arm/recipes-security/optee/optee-examples.inc
> > > > @@ -5,16 +5,14 @@ HOMEPAGE =3D"https://github.com/linaro-swg/optee_=
examples"
> > > >   LICENSE =3D "BSD-2-Clause"
> > > >   LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3Dcd95ab417e23b94f381dafc=
453d70c30"
> > > > -DEPENDS =3D "optee-client optee-os-tadevkit python3-pycryptodome-n=
ative"
> > > > +DEPENDS =3D "optee-client optee-os-tadevkit python3-pycryptodome-n=
ative python3-cryptography-native"
> > > >   inherit python3native
> > > >   require optee.inc
> > > >   SRC_URI =3D "git://github.com/linaro-swg/optee_examples.git;branc=
h=3Dmaster;protocol=3Dhttps \
> > > > -file://0001-plugins-Honour-default-cross-compiler-environment-se.p=
atch  \
> > > > -file://0002-Makefile-Enable-plugins-installation-in-rootfs.patch  =
\
> > > > -          "
> > > > +file://0001-Makefile-Fix-non-portable-sh-check-for-plugins.patch"
> > > >   EXTRA_OEMAKE +=3D "TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
> > > >                    HOST_CROSS_COMPILE=3D${HOST_PREFIX} \
> > > > @@ -25,6 +23,7 @@ EXTRA_OEMAKE +=3D "TA_DEV_KIT_DIR=3D${TA_DEV_KIT_=
DIR} \
> > > >   S =3D "${WORKDIR}/git"
> > > >   B =3D "${WORKDIR}/build"
> > > > +
> > > >   do_compile() {
> > > >       oe_runmake -C ${S}
> > > >   }
> > > > diff --git a/meta-arm/recipes-security/optee/optee-examples/0001-Ma=
kefile-Fix-non-portable-sh-check-for-plugins.patch b/meta-arm/recipes-secur=
ity/optee/optee-examples/0001-Makefile-Fix-non-portable-sh-check-for-plugin=
s.patch
> > > > new file mode 100644
> > > > index 0000000..70add62
> > > > --- /dev/null
> > > > +++ b/meta-arm/recipes-security/optee/optee-examples/0001-Makefile-=
Fix-non-portable-sh-check-for-plugins.patch
> > > > @@ -0,0 +1,46 @@
> > > > +From 11610debf750f15c7a104db7315dcd7d69e282a8 Mon Sep 17 00:00:00 =
2001
> > > > +From: Alejandro Enedino Hernandez Samaniego<alhe@linux.microsoft.c=
om>
> > > > +Date: Sat, 26 Feb 2022 01:52:26 +0000
> > > > +Subject: [PATCH] Makefile: Fix non-portable sh check for plugins
> > > > +
> > > > +Upstream-Status: Pending
> > > > +
> > > > +We previously held a patch that used "=3D" for comparison, but whe=
n
> > > > +that patch got upstreamed it was changed to "=3D=3D" which is non-=
portable,
> > > > +resulting in an error:
> > > > +
> > > > +/bin/sh: 6: [: acipher: unexpected operator
> > > > +/bin/sh: 6: [: plugins: unexpected operator
> > > > +/bin/sh: 6: [: hello_world: unexpected operator
> > > > +/bin/sh: 6: [: hotp: unexpected operator
> > > > +/bin/sh: 6: [: aes: unexpected operator
> > > > +/bin/sh: 6: [: random: unexpected operator
> > > > +/bin/sh: 6: [: secure_storage: unexpected operator
> > > > +
> > > > +if /bin/sh doesnt point to bash.
> > > > +
> > > > +Which in turn causes our do_install task to fail since plugins are=
nt
> > > > +where we expect them to be.
> > > > +
> > > > +
> > > > +Signed-off-by: Alejandro Enedino Hernandez Samaniego<alhe@linux.mi=
crosoft.com>
> > > > +---
> > > > + Makefile | 2 +-
> > > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/Makefile b/Makefile
> > > > +index b3f16aa..9359d95 100644
> > > > +--- a/Makefile
> > > > ++++ b/Makefile
> > > > +@@ -31,7 +31,7 @@ prepare-for-rootfs: examples
> > > > +                         cp -p $$example/host/optee_example_$$exam=
ple $(OUTPUT_DIR)/ca/; \
> > > > +                 fi; \
> > > > +                 cp -pr $$example/ta/*.ta $(OUTPUT_DIR)/ta/; \
> > > > +-                if [ $$example =3D=3D plugins ]; then \
> > > > ++                if [ $$example =3D plugins ]; then \
> > > > +                         cp -p plugins/syslog/*.plugin $(OUTPUT_DI=
R)/plugins/; \
> > > > +                 fi; \
> > > > +         done
> > > > +--
> > > > +2.25.1
> > > > +
> > > > diff --git a/meta-arm/recipes-security/optee/optee-examples/0001-pl=
ugins-Honour-default-cross-compiler-environment-se.patch b/meta-arm/recipes=
-security/optee/optee-examples/0001-plugins-Honour-default-cross-compiler-e=
nvironment-se.patch
> > > > deleted file mode 100644
> > > > index 033e48c..0000000
> > > > --- a/meta-arm/recipes-security/optee/optee-examples/0001-plugins-H=
onour-default-cross-compiler-environment-se.patch
> > > > +++ /dev/null
> > > > @@ -1,84 +0,0 @@
> > > > -From 79c826c249001700007a6dffe80c3d61ff4428ef Mon Sep 17 00:00:00 =
2001
> > > > -From: Sumit Garg<sumit.garg@linaro.org>
> > > > -Date: Tue, 20 Jul 2021 13:54:30 +0530
> > > > -Subject: [PATCH 1/2] plugins: Honour default cross compiler enviro=
nment setup
> > > > -
> > > > -Honour default $(CC), $(CFLAGS) and $(LDFLAGS) variables. Without =
this
> > > > -plugins example fails to build for OE/Yocto.
> > > > -
> > > > -Upstream-Status: Submitted [https://github.com/linaro-swg/optee_ex=
amples/pull/87]
> > > > -
> > > > -Signed-off-by: Sumit Garg<sumit.garg@linaro.org>
> > > > ----
> > > > - plugins/Makefile        |  2 +-
> > > > - plugins/host/Makefile   |  2 +-
> > > > - plugins/syslog/Makefile | 16 ++++++++++++----
> > > > - 3 files changed, 14 insertions(+), 6 deletions(-)
> > > > -
> > > > -diff --git a/plugins/Makefile b/plugins/Makefile
> > > > -index 2372b38..ea472b4 100644
> > > > ---- a/plugins/Makefile
> > > > -+++ b/plugins/Makefile
> > > > -@@ -8,7 +8,7 @@ TA_CROSS_COMPILE ?=3D $(CROSS_COMPILE)
> > > > - all:
> > > > -         $(MAKE) -C host CROSS_COMPILE=3D"$(HOST_CROSS_COMPILE)" -=
-no-builtin-variables
> > > > -         $(MAKE) -C ta CROSS_COMPILE=3D"$(TA_CROSS_COMPILE)" LDFLA=
GS=3D""
> > > > --        $(MAKE) -C syslog CROSS_COMPILE=3D"$(HOST_CROSS_COMPILE)"
> > > > -+        $(MAKE) -C syslog CROSS_COMPILE=3D"$(HOST_CROSS_COMPILE)"=
 --no-builtin-variables
> > > > -
> > > > - .PHONY: clean
> > > > - clean:
> > > > -diff --git a/plugins/host/Makefile b/plugins/host/Makefile
> > > > -index 7285104..76244c7 100644
> > > > ---- a/plugins/host/Makefile
> > > > -+++ b/plugins/host/Makefile
> > > > -@@ -20,7 +20,7 @@ BINARY =3D optee_example_plugins
> > > > - all: $(BINARY)
> > > > -
> > > > - $(BINARY): $(OBJS)
> > > > --        $(CC) -o $@ $< $(LDADD)
> > > > -+        $(CC) $(LDFLAGS) -o $@ $< $(LDADD)
> > > > -
> > > > - .PHONY: clean
> > > > - clean:
> > > > -diff --git a/plugins/syslog/Makefile b/plugins/syslog/Makefile
> > > > -index 62d916a..71f5f92 100644
> > > > ---- a/plugins/syslog/Makefile
> > > > -+++ b/plugins/syslog/Makefile
> > > > -@@ -1,3 +1,11 @@
> > > > -+CC      ?=3D $(CROSS_COMPILE)gcc
> > > > -+LD      ?=3D $(CROSS_COMPILE)ld
> > > > -+AR      ?=3D $(CROSS_COMPILE)ar
> > > > -+NM      ?=3D $(CROSS_COMPILE)nm
> > > > -+OBJCOPY ?=3D $(CROSS_COMPILE)objcopy
> > > > -+OBJDUMP ?=3D $(CROSS_COMPILE)objdump
> > > > -+READELF ?=3D $(CROSS_COMPILE)readelf
> > > > -+
> > > > - PLUGIN_UUID =3D 96bcf744-4f72-4866-bf1d-8634fd9c65e5
> > > > -
> > > > - PLUGIN                  =3D $(PLUGIN_UUID).plugin
> > > > -@@ -6,17 +14,17 @@ PLUGIN_OBJ            =3D $(patsubst %.c, %.o, =
$(PLUGIN_SRS))
> > > > - PLUGIN_INCLUDES_DIR     =3D $(CURDIR) $(TEEC_EXPORT)/include
> > > > -
> > > > - PLUGIN_INCLUDES         =3D $(addprefix -I, $(PLUGIN_INCLUDES_DIR=
))
> > > > --PLUGIN_CCFLAGS          =3D -Wall -fPIC
> > > > --PLUGIN_LDFLAGS          =3D -shared
> > > > -+PLUGIN_CCFLAGS          =3D $(CFLAGS) -Wall -fPIC
> > > > -+PLUGIN_LDFLAGS          =3D $(LDFLAGS) -shared
> > > > -
> > > > - .PHONY: all
> > > > - all: $(PLUGIN)
> > > > -
> > > > - $(PLUGIN): $(PLUGIN_OBJ)
> > > > --        $(CROSS_COMPILE)gcc $(PLUGIN_LDFLAGS) $(PLUGIN_OBJ) -o $@
> > > > -+        $(CC) $(PLUGIN_LDFLAGS) $(PLUGIN_OBJ) -o $@
> > > > -
> > > > - %.o: %.c
> > > > --        $(CROSS_COMPILE)gcc $(PLUGIN_CCFLAGS) $(PLUGIN_INCLUDES) =
-c $*.c -o $*.o
> > > > -+        $(CC) $(PLUGIN_CCFLAGS) $(PLUGIN_INCLUDES) -c $*.c -o $*.=
o
> > > > -
> > > > - .PHONY: clean
> > > > - clean:
> > > > ---
> > > > -2.25.1
> > > > -
> > > > diff --git a/meta-arm/recipes-security/optee/optee-examples/0002-Ma=
kefile-Enable-plugins-installation-in-rootfs.patch b/meta-arm/recipes-secur=
ity/optee/optee-examples/0002-Makefile-Enable-plugins-installation-in-rootf=
s.patch
> > > > deleted file mode 100644
> > > > index 80e6b5f..0000000
> > > > --- a/meta-arm/recipes-security/optee/optee-examples/0002-Makefile-=
Enable-plugins-installation-in-rootfs.patch
> > > > +++ /dev/null
> > > > @@ -1,37 +0,0 @@
> > > > -From f4e5e74548d92258855434b550c58fe44993c148 Mon Sep 17 00:00:00 =
2001
> > > > -From: Sumit Garg<sumit.garg@linaro.org>
> > > > -Date: Tue, 20 Jul 2021 14:20:10 +0530
> > > > -Subject: [PATCH] Makefile: Enable plugins installation in rootfs
> > > > -
> > > > -Upstream-Status: Submitted [https://github.com/linaro-swg/optee_ex=
amples/pull/87]
> > > > -
> > > > -Signed-off-by: Sumit Garg<sumit.garg@linaro.org>
> > > > -
> > > > ----
> > > > - Makefile | 5 +++++
> > > > - 1 file changed, 5 insertions(+)
> > > > -
> > > > -diff --git a/Makefile b/Makefile
> > > > -index a275842..9359d95 100644
> > > > ---- a/Makefile
> > > > -+++ b/Makefile
> > > > -@@ -25,14 +25,19 @@ prepare-for-rootfs: examples
> > > > -         @mkdir -p $(OUTPUT_DIR)
> > > > -         @mkdir -p $(OUTPUT_DIR)/ta
> > > > -         @mkdir -p $(OUTPUT_DIR)/ca
> > > > -+        @mkdir -p $(OUTPUT_DIR)/plugins
> > > > -         @for example in $(EXAMPLE_LIST); do \
> > > > -                 if [ -e $$example/host/optee_example_$$example ];=
 then \
> > > > -                         cp -p $$example/host/optee_example_$$exam=
ple $(OUTPUT_DIR)/ca/; \
> > > > -                 fi; \
> > > > -                 cp -pr $$example/ta/*.ta $(OUTPUT_DIR)/ta/; \
> > > > -+                if [ $$example =3D plugins ]; then \
> > > > -+                        cp -p plugins/syslog/*.plugin $(OUTPUT_DI=
R)/plugins/; \
> > > > -+                fi; \
> > > > -         done
> > > > -
> > > > - prepare-for-rootfs-clean:
> > > > -         @rm -rf $(OUTPUT_DIR)/ta
> > > > -         @rm -rf $(OUTPUT_DIR)/ca
> > > > -+        @rm -rf $(OUTPUT_DIR)/plugins
> > > > -         @rmdir --ignore-fail-on-non-empty $(OUTPUT_DIR) || test !=
 -e $(OUTPUT_DIR)
> > > > diff --git a/meta-arm/recipes-security/optee/optee-examples_3.14.0.=
bb b/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
> > > > deleted file mode 100644
> > > > index f2b5f7d..0000000
> > > > --- a/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
> > > > +++ /dev/null
> > > > @@ -1,4 +0,0 @@
> > > > -require optee-examples.inc
> > > > -
> > > > -SRCREV =3D "e9c870525af8f7e7fccf575a0ca5394ce55adcec"
> > > > -
> > > > diff --git a/meta-arm/recipes-security/optee/optee-examples_3.16.0.=
bb b/meta-arm/recipes-security/optee/optee-examples_3.16.0.bb
> > > > new file mode 100644
> > > > index 0000000..b5f6269
> > > > --- /dev/null
> > > > +++ b/meta-arm/recipes-security/optee/optee-examples_3.16.0.bb
> > > > @@ -0,0 +1,3 @@
> > > > +require optee-examples.inc
> > > > +
> > > > +SRCREV =3D "65fc74309e12189ad5b6ce3ffec37c8011088a5a"
> > > > diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14=
.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0.bb
> > > > similarity index 94%
> > > > rename from meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.=
0.bb
> > > > rename to meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0.=
bb
> > > > index 0d37a52..c710e27 100644
> > > > --- a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> > > > +++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0.bb
> > > > @@ -1,10 +1,11 @@
> > > >   FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os:"
> > > > -require optee-os_3.14.0.bb
> > > > +require optee-os_3.16.0.bb
> > > >   SUMMARY =3D "OP-TEE Trusted OS TA devkit"
> > > >   DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
> > > >   HOMEPAGE =3D"https://www.op-tee.org/"
> > > > +
> > > >   do_install() {
> > > >       #install TA devkit
> > > >       install -d ${D}${includedir}/optee/export-user_ta/
> > > > diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-ar=
m/recipes-security/optee/optee-os.inc
> > > > index 1506a58..57c64fd 100644
> > > > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > > > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > > > @@ -10,7 +10,7 @@ require optee.inc
> > > >   CVE_PRODUCT =3D "linaro:op-tee op-tee:op-tee_os"
> > > > -DEPENDS =3D "python3-pycryptodome-native python3-pyelftools-native=
"
> > > > +DEPENDS =3D "python3-pycryptodome-native python3-pyelftools-native=
 python3-cryptography-native"
> > > >   DEPENDS:append:toolchain-clang =3D " compiler-rt"
> > > > diff --git a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb b/m=
eta-arm/recipes-security/optee/optee-os_3.16.0.bb
> > > > similarity index 76%
> > > > rename from meta-arm/recipes-security/optee/optee-os_3.14.0.bb
> > > > rename to meta-arm/recipes-security/optee/optee-os_3.16.0.bb
> > > > index 95d82bb..873e964 100644
> > > > --- a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
> > > > +++ b/meta-arm/recipes-security/optee/optee-os_3.16.0.bb
> > > > @@ -1,6 +1,6 @@
> > > >   require optee-os.inc
> > > > -SRCREV =3D "d21befa5e53eae9db469eba1685f5aa5c6f92c2f"
> > > > +SRCREV =3D "d0b742d1564834dac903f906168d7357063d5459"
> > > >   SRC_URI:append =3D " \
> > > >       file://0006-allow-setting-sysroot-for-libgcc-lookup.patch  \
> > > > diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-=
arm/recipes-security/optee/optee-test.inc
> > > > index aada243..33eda29 100644
> > > > --- a/meta-arm/recipes-security/optee/optee-test.inc
> > > > +++ b/meta-arm/recipes-security/optee/optee-test.inc
> > > > @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D"file://${S}/LICENSE.md;md5=3Dd=
aa2bcccc666345ab8940aab1315a4fa"
> > > >   inherit python3native ptest
> > > >   require optee.inc
> > > > -DEPENDS =3D "optee-client optee-os-tadevkit python3-pycryptodome-n=
ative"
> > > > +DEPENDS =3D "optee-client optee-os-tadevkit python3-pycryptodome-n=
ative python3-cryptography-native"
> > > >   SRC_URI =3D "git://github.com/OP-TEE/optee_test.git;branch=3Dmast=
er;protocol=3Dhttps \
> > > >              file://run-ptest  \
> > > > diff --git a/meta-arm/recipes-security/optee/optee-test_3.14.0.bb b=
/meta-arm/recipes-security/optee/optee-test_3.14.0.bb
> > > > deleted file mode 100644
> > > > index 6367c27..0000000
> > > > --- a/meta-arm/recipes-security/optee/optee-test_3.14.0.bb
> > > > +++ /dev/null
> > > > @@ -1,3 +0,0 @@
> > > > -require optee-test.inc
> > > > -
> > > > -SRCREV =3D "f2eb88affbb7f028561b4fd5cbd049d5d704f741"
> > > > diff --git a/meta-arm/recipes-security/optee/optee-test_3.16.0.bb b=
/meta-arm/recipes-security/optee/optee-test_3.16.0.bb
> > > > new file mode 100644
> > > > index 0000000..03f9c34
> > > > --- /dev/null
> > > > +++ b/meta-arm/recipes-security/optee/optee-test_3.16.0.bb
> > > > @@ -0,0 +1,3 @@
> > > > +require optee-test.inc
> > > > +
> > > > +SRCREV =3D "1cf0e6d2bdd1145370033d4e182634458528579d"
> > > > diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/r=
ecipes-security/optee/optee.inc
> > > > index f02a022..beae366 100644
> > > > --- a/meta-arm/recipes-security/optee/optee.inc
> > > > +++ b/meta-arm/recipes-security/optee/optee.inc
> > > > @@ -26,3 +26,6 @@ EXTRA_OEMAKE +=3D "V=3D1 \
> > > >                    OPTEE_CLIENT_EXPORT=3D${STAGING_DIR_HOST}${prefi=
x} \
> > > >                    TEEC_EXPORT=3D${STAGING_DIR_HOST}${prefix} \
> > > >                   "
> > > > +# python3-cryptography needs the legacy provider, so set OPENSSL_M=
ODULES to the
> > > > +# right path until this is relocated automatically.
> > > > +export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"
> > > > --
> > > > 2.25.1
> > > >
> > > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#3088):https://lists.yoctoproject.org/g/meta-arm=
/message/3088
> > > > Mute This Topic:https://lists.yoctoproject.org/mt/89404067/4354175
> > > > Group Owner:meta-arm+owner@lists.yoctoproject.org
> > > > Unsubscribe:https://lists.yoctoproject.org/g/meta-arm/unsub  [alhe@=
linux.microsoft.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >

--_000_AM5PR0801MB17164CCA6910A06008AF914AFD049AM5PR0801MB1716_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hello,
<div><br>
</div>
<div>I suggest the following:</div>
<div><br>
</div>
<div>In meta-arm-bsp/conf/layer.conf add :</div>
<div><br>
</div>
<div>LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot =3D &quot; meta-=
python openembedded-layer&quot;</div>
<div><br>
</div>
<div>In ci/qemuarm64-secureboot.yml add:</div>
<div><br>
</div>
<div>ci/meta-openembedded.yml</div>
<div><br>
</div>
Kind regards<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Sumit Garg &lt;sumit.=
garg@linaro.org&gt;<br>
<b>Sent:</b> 03 March 2022 05:31<br>
<b>To:</b> Jon Mason &lt;jdmason@kudzu.us&gt;; Alejandro Hernandez &lt;alhe=
@linux.microsoft.com&gt;<br>
<b>Cc:</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;; Vishnu Banavath &lt;Vishnu.Banavath@arm.com&gt;; Maxim Uvarov &lt;=
maxim.uvarov@linaro.org&gt;; Peter Griffin &lt;peter.griffin@linaro.org&gt;=
; Denys Dmytriyenko &lt;denis@denix.org&gt;; Drew Reed &lt;Drew.Reed@arm.co=
m&gt;;
 Abdellatif El Khlifi &lt;Abdellatif.ElKhlifi@arm.com&gt;<br>
<b>Subject:</b> Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, 2 Mar 2022 at 20:16, Jon Mason &lt;jdmason=
@kudzu.us&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Mar 01, 2022 at 09:54:04PM +0000, Alejandro Hernandez wrote:<b=
r>
&gt; &gt; Hi John,<br>
&gt; &gt;<br>
&gt; &gt; On 3/1/22 16:27, Jon Mason wrote:<br>
&gt; &gt; &gt; On Fri, Feb 25, 2022 at 08:04:41PM -0700, Alejandro Enedino =
Hernandez Samaniego wrote:<br>
&gt; &gt; &gt; &gt; - Removes upstreamed patches for optee-examples<br>
&gt; &gt; &gt; &gt; - Fixes optee-examples installation<br>
&gt; &gt; &gt; &gt; - Includes new python3-cryptography dependency<br>
&gt; &gt; &gt; &gt; - Fixes python3-cryptography to work with openssl<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Tested on qemuarm64-secureboot via optee-examples xtest=
 -l 15<br>
&gt; &gt; &gt; With the new changes in python3-crypto, this is no longer wo=
rking.<br>
&gt; &gt; &gt; I'm seeing the following error in CI.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --- Error summary ---<br>
&gt; &gt; &gt; ERROR: Nothing PROVIDES 'python3-cryptography-native' (but /=
builds/jonmason00/meta-arm/meta-arm/recipes-security/optee/optee-os_3.16.0.=
bb DEPENDS on or otherwise requires it). Close matches:<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp; python3-cython-native<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp; python3-pycryptodome-native<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp; python3-typogrify-native<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I _think_ that adding meta-openembedded.yml being adding to =
the<br>
&gt; &gt; &gt; machines should fix it, but I'm not sure that is the right s=
olution.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; Jon<br>
&gt; &gt;<br>
&gt; &gt; My apologies, I was testing with meta-oe/meta-python enabled henc=
e I didnt<br>
&gt; &gt; see the error before.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I'm not sure its the right solution either, this dependency is co=
ming from<br>
&gt; &gt; the pem_to_pub_c.py script which is now using python3-cyrptograph=
y since<br>
&gt; &gt; commit <a href=3D"https://github.com/OP-TEE/optee_os/commit/169ea=
c19852d98d8ade821f913bbdd76faf52823">
https://github.com/OP-TEE/optee_os/commit/169eac19852d98d8ade821f913bbdd76f=
af52823</a><br>
&gt; &gt; (this also means we could remove python3-cryptodome from the depe=
ndencies as<br>
&gt; &gt; well), as far as I can tell this creates a hard dependency, passi=
ng<br>
&gt; &gt; EXTRA_OEMAKE +=3D &quot; CFG_WITH_USER_TA=3Dn&quot; would avoid e=
xecuting the script<br>
&gt; &gt; completely but I also dont think thats what we want.<br>
&gt; &gt;<br>
&gt; &gt; Should we include meta-openembedded.yml?,&nbsp; or what other cho=
ice do we have?<br>
&gt; &gt; create a python3-cyrptography recipe to meta-arm?, thoughts?<br>
<br>
Yes, we should include meta-openembedded.yml as a dependency and<br>
remove python3-cryptodome from the dependencies.<br>
<br>
-Sumit<br>
<br>
&gt;<br>
&gt; OPTEE isn't an area I understand well (to know whether removing this<b=
r>
&gt; is superior to adding the dependency in the files).&nbsp; So, I'm dire=
ctly<br>
&gt; cc'ing contributors that I think will have an opinion to this<br>
&gt; response.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Jon<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt;<br>
&gt; &gt; Alejandro<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego&lt=
;alhe@linux.microsoft.com&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; ....bbappend =3D&gt; optee-client_3.16.0.bb=
append} |&nbsp; 0<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; ...pend =3D&gt; optee-os-tadevkit_3.16.0.bb=
append} |&nbsp; 0<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; ...14.0.bbappend =3D&gt; optee-os_3.16.0.bb=
append} |&nbsp; 0<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; ....0.bbappend =3D&gt; optee-test_3.16.0.bb=
append} |&nbsp; 0<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; .../optee-ftpm/optee-ftpm_git.bb&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;=
 8 +-<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; .../optee/optee-client_3.14.0.bb&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;=
 3 -<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; .../optee/optee-client_3.16.0.bb&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;=
 3 +<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; .../recipes-security/optee/optee-examples.i=
nc |&nbsp; 7 +-<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; ...ix-non-portable-sh-check-for-plugins.pat=
ch | 46 ++++++++++<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; ...efault-cross-compiler-environment-se.pat=
ch | 84 -------------------<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; ...nable-plugins-installation-in-rootfs.pat=
ch | 37 --------<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; .../optee/optee-examples_3.14.0.bb&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 -<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; .../optee/optee-examples_3.16.0.bb&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; ..._3.14.0.bb =3D&gt; optee-os-tadevkit_3.1=
6.0.bb} |&nbsp; 3 +-<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; meta-arm/recipes-security/optee/optee-os.in=
c&nbsp; |&nbsp; 2 +-<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; ...{optee-os_3.14.0.bb =3D&gt; optee-os_3.1=
6.0.bb} |&nbsp; 2 +-<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; .../recipes-security/optee/optee-test.inc&n=
bsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; .../optee/optee-test_3.14.0.bb&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; |&nbsp; 3 -<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; .../optee/optee-test_3.16.0.bb&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; |&nbsp; 3 +<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; meta-arm/recipes-security/optee/optee.inc&n=
bsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; 20 files changed, 73 insertions(+), 140 del=
etions(-)<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; rename meta-arm-bsp/recipes-security/optee/=
{optee-client_3.14.0.bbappend =3D&gt; optee-client_3.16.0.bbappend} (100%)<=
br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; rename meta-arm-bsp/recipes-security/optee/=
{optee-os-tadevkit_3.14.0.bbappend =3D&gt; optee-os-tadevkit_3.16.0.bbappen=
d} (100%)<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; rename meta-arm-bsp/recipes-security/optee/=
{optee-os_3.14.0.bbappend =3D&gt; optee-os_3.16.0.bbappend} (100%)<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; rename meta-arm-bsp/recipes-security/optee/=
{optee-test_3.14.0.bbappend =3D&gt; optee-test_3.16.0.bbappend} (100%)<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; delete mode 100644 meta-arm/recipes-securit=
y/optee/optee-client_3.14.0.bb<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; create mode 100644 meta-arm/recipes-securit=
y/optee/optee-client_3.16.0.bb<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; create mode 100644 meta-arm/recipes-securit=
y/optee/optee-examples/0001-Makefile-Fix-non-portable-sh-check-for-plugins.=
patch<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; delete mode 100644 meta-arm/recipes-securit=
y/optee/optee-examples/0001-plugins-Honour-default-cross-compiler-environme=
nt-se.patch<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; delete mode 100644 meta-arm/recipes-securit=
y/optee/optee-examples/0002-Makefile-Enable-plugins-installation-in-rootfs.=
patch<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; delete mode 100644 meta-arm/recipes-securit=
y/optee/optee-examples_3.14.0.bb<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; create mode 100644 meta-arm/recipes-securit=
y/optee/optee-examples_3.16.0.bb<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; rename meta-arm/recipes-security/optee/{opt=
ee-os-tadevkit_3.14.0.bb =3D&gt; optee-os-tadevkit_3.16.0.bb} (94%)<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; rename meta-arm/recipes-security/optee/{opt=
ee-os_3.14.0.bb =3D&gt; optee-os_3.16.0.bb} (76%)<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; delete mode 100644 meta-arm/recipes-securit=
y/optee/optee-test_3.14.0.bb<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; create mode 100644 meta-arm/recipes-securit=
y/optee/optee-test_3.16.0.bb<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/meta-arm-bsp/recipes-security/optee/optee-=
client_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-client_3=
.16.0.bbappend<br>
&gt; &gt; &gt; &gt; similarity index 100%<br>
&gt; &gt; &gt; &gt; rename from meta-arm-bsp/recipes-security/optee/optee-c=
lient_3.14.0.bbappend<br>
&gt; &gt; &gt; &gt; rename to meta-arm-bsp/recipes-security/optee/optee-cli=
ent_3.16.0.bbappend<br>
&gt; &gt; &gt; &gt; diff --git a/meta-arm-bsp/recipes-security/optee/optee-=
os-tadevkit_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os-=
tadevkit_3.16.0.bbappend<br>
&gt; &gt; &gt; &gt; similarity index 100%<br>
&gt; &gt; &gt; &gt; rename from meta-arm-bsp/recipes-security/optee/optee-o=
s-tadevkit_3.14.0.bbappend<br>
&gt; &gt; &gt; &gt; rename to meta-arm-bsp/recipes-security/optee/optee-os-=
tadevkit_3.16.0.bbappend<br>
&gt; &gt; &gt; &gt; diff --git a/meta-arm-bsp/recipes-security/optee/optee-=
os_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os_3.16.0.bb=
append<br>
&gt; &gt; &gt; &gt; similarity index 100%<br>
&gt; &gt; &gt; &gt; rename from meta-arm-bsp/recipes-security/optee/optee-o=
s_3.14.0.bbappend<br>
&gt; &gt; &gt; &gt; rename to meta-arm-bsp/recipes-security/optee/optee-os_=
3.16.0.bbappend<br>
&gt; &gt; &gt; &gt; diff --git a/meta-arm-bsp/recipes-security/optee/optee-=
test_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-test_3.16.=
0.bbappend<br>
&gt; &gt; &gt; &gt; similarity index 100%<br>
&gt; &gt; &gt; &gt; rename from meta-arm-bsp/recipes-security/optee/optee-t=
est_3.14.0.bbappend<br>
&gt; &gt; &gt; &gt; rename to meta-arm-bsp/recipes-security/optee/optee-tes=
t_3.16.0.bbappend<br>
&gt; &gt; &gt; &gt; diff --git a/meta-arm/recipes-security/optee-ftpm/optee=
-ftpm_git.bb b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb<br>
&gt; &gt; &gt; &gt; index f2a74da..0eb64cd 100644<br>
&gt; &gt; &gt; &gt; --- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_g=
it.bb<br>
&gt; &gt; &gt; &gt; +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_g=
it.bb<br>
&gt; &gt; &gt; &gt; @@ -15,7 +15,9 @@ inherit deploy python3native<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; LICENSE =3D &quot;MIT&quot;<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; LIC_FILES_CHKSUM =3D&quot;<a href=3D"file:/=
/${S}/LICENSE;md5=3D27e94c0280987ab296b0b8dd02ab9fe5">file://${S}/LICENSE;m=
d5=3D27e94c0280987ab296b0b8dd02ab9fe5</a>&quot;<br>
&gt; &gt; &gt; &gt; -DEPENDS =3D &quot;python3-pycryptodome-native python3-=
pycryptodomex-native python3-pyelftools-native optee-os-tadevkit&quot;<br>
&gt; &gt; &gt; &gt; +DEPENDS =3D &quot;python3-pycryptodome-native python3-=
pycryptodomex-native python3-pyelftools-native optee-os-tadevkit \<br>
&gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp; python3-cryptography-native \<br>
&gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp; &quot;<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; FTPM_UUID=3D&quot;bc50d971-d4c9-42c4-82cb-3=
43fb7f37896&quot;<br>
&gt; &gt; &gt; &gt; @@ -48,6 +50,10 @@ EXTRA_OEMAKE:append:aarch64:qemuall =
=3D &quot;\<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CFG_ARM64_ta_arm64=
=3Dy \<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; &quot;<br>
&gt; &gt; &gt; &gt; +# python3-cryptography needs the legacy provider, so s=
et OPENSSL_MODULES to the<br>
&gt; &gt; &gt; &gt; +# right path until this is relocated automatically.<br=
>
&gt; &gt; &gt; &gt; +export OPENSSL_MODULES=3D&quot;${STAGING_LIBDIR_NATIVE=
}/ossl-modules&quot;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; PARALLEL_MAKE =3D &quot;&quot;<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; do_compile() {<br>
&gt; &gt; &gt; &gt; diff --git a/meta-arm/recipes-security/optee/optee-clie=
nt_3.14.0.bb b/meta-arm/recipes-security/optee/optee-client_3.14.0.bb<br>
&gt; &gt; &gt; &gt; deleted file mode 100644<br>
&gt; &gt; &gt; &gt; index be78b88..0000000<br>
&gt; &gt; &gt; &gt; --- a/meta-arm/recipes-security/optee/optee-client_3.14=
.0.bb<br>
&gt; &gt; &gt; &gt; +++ /dev/null<br>
&gt; &gt; &gt; &gt; @@ -1,3 +0,0 @@<br>
&gt; &gt; &gt; &gt; -require optee-client.inc<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -SRCREV =3D &quot;06e1b32f6a7028e039c625b07cfc25fda0c17=
d53&quot;<br>
&gt; &gt; &gt; &gt; diff --git a/meta-arm/recipes-security/optee/optee-clie=
nt_3.16.0.bb b/meta-arm/recipes-security/optee/optee-client_3.16.0.bb<br>
&gt; &gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; &gt; index 0000000..4a36cbc<br>
&gt; &gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; &gt; +++ b/meta-arm/recipes-security/optee/optee-client_3.16=
.0.bb<br>
&gt; &gt; &gt; &gt; @@ -0,0 +1,3 @@<br>
&gt; &gt; &gt; &gt; +require optee-client.inc<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +SRCREV =3D &quot;06db73b3f3fdb8d23eceaedbc46c49c0b45fd=
1e2&quot;<br>
&gt; &gt; &gt; &gt; diff --git a/meta-arm/recipes-security/optee/optee-exam=
ples.inc b/meta-arm/recipes-security/optee/optee-examples.inc<br>
&gt; &gt; &gt; &gt; index 656722e..097f892 100644<br>
&gt; &gt; &gt; &gt; --- a/meta-arm/recipes-security/optee/optee-examples.in=
c<br>
&gt; &gt; &gt; &gt; +++ b/meta-arm/recipes-security/optee/optee-examples.in=
c<br>
&gt; &gt; &gt; &gt; @@ -5,16 +5,14 @@ HOMEPAGE =3D&quot;<a href=3D"https://=
github.com/linaro-swg/optee_examples">https://github.com/linaro-swg/optee_e=
xamples</a>&quot;<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; LICENSE =3D &quot;BSD-2-Clause&quot;<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; LIC_FILES_CHKSUM =3D&quot;<a href=3D"file:/=
/LICENSE;md5=3Dcd95ab417e23b94f381dafc453d70c30">file://LICENSE;md5=3Dcd95a=
b417e23b94f381dafc453d70c30</a>&quot;<br>
&gt; &gt; &gt; &gt; -DEPENDS =3D &quot;optee-client optee-os-tadevkit pytho=
n3-pycryptodome-native&quot;<br>
&gt; &gt; &gt; &gt; +DEPENDS =3D &quot;optee-client optee-os-tadevkit pytho=
n3-pycryptodome-native python3-cryptography-native&quot;<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; inherit python3native<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; require optee.inc<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; SRC_URI =3D &quot;git://github.com/linaro-s=
wg/optee_examples.git;branch=3Dmaster;protocol=3Dhttps \<br>
&gt; &gt; &gt; &gt; -file://0001-plugins-Honour-default-cross-compiler-envi=
ronment-se.patch&nbsp; \<br>
&gt; &gt; &gt; &gt; -file://0002-Makefile-Enable-plugins-installation-in-ro=
otfs.patch&nbsp; \<br>
&gt; &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &quot;<br>
&gt; &gt; &gt; &gt; +file://0001-Makefile-Fix-non-portable-sh-check-for-plu=
gins.patch&quot;<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; EXTRA_OEMAKE +=3D &quot;TA_DEV_KIT_DIR=3D${=
TA_DEV_KIT_DIR} \<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HOST_CROSS_COMPI=
LE=3D${HOST_PREFIX} \<br>
&gt; &gt; &gt; &gt; @@ -25,6 +23,7 @@ EXTRA_OEMAKE +=3D &quot;TA_DEV_KIT_DI=
R=3D${TA_DEV_KIT_DIR} \<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; B =3D &quot;${WORKDIR}/build&quot;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; do_compile() {<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe_runmake -C ${S}<=
br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; }<br>
&gt; &gt; &gt; &gt; diff --git a/meta-arm/recipes-security/optee/optee-exam=
ples/0001-Makefile-Fix-non-portable-sh-check-for-plugins.patch b/meta-arm/r=
ecipes-security/optee/optee-examples/0001-Makefile-Fix-non-portable-sh-chec=
k-for-plugins.patch<br>
&gt; &gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; &gt; index 0000000..70add62<br>
&gt; &gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; &gt; +++ b/meta-arm/recipes-security/optee/optee-examples/00=
01-Makefile-Fix-non-portable-sh-check-for-plugins.patch<br>
&gt; &gt; &gt; &gt; @@ -0,0 +1,46 @@<br>
&gt; &gt; &gt; &gt; +From 11610debf750f15c7a104db7315dcd7d69e282a8 Mon Sep =
17 00:00:00 2001<br>
&gt; &gt; &gt; &gt; +From: Alejandro Enedino Hernandez Samaniego&lt;alhe@li=
nux.microsoft.com&gt;<br>
&gt; &gt; &gt; &gt; +Date: Sat, 26 Feb 2022 01:52:26 +0000<br>
&gt; &gt; &gt; &gt; +Subject: [PATCH] Makefile: Fix non-portable sh check f=
or plugins<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +Upstream-Status: Pending<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +We previously held a patch that used &quot;=3D&quot; f=
or comparison, but when<br>
&gt; &gt; &gt; &gt; +that patch got upstreamed it was changed to &quot;=3D=
=3D&quot; which is non-portable,<br>
&gt; &gt; &gt; &gt; +resulting in an error:<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +/bin/sh: 6: [: acipher: unexpected operator<br>
&gt; &gt; &gt; &gt; +/bin/sh: 6: [: plugins: unexpected operator<br>
&gt; &gt; &gt; &gt; +/bin/sh: 6: [: hello_world: unexpected operator<br>
&gt; &gt; &gt; &gt; +/bin/sh: 6: [: hotp: unexpected operator<br>
&gt; &gt; &gt; &gt; +/bin/sh: 6: [: aes: unexpected operator<br>
&gt; &gt; &gt; &gt; +/bin/sh: 6: [: random: unexpected operator<br>
&gt; &gt; &gt; &gt; +/bin/sh: 6: [: secure_storage: unexpected operator<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +if /bin/sh doesnt point to bash.<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +Which in turn causes our do_install task to fail since=
 plugins arent<br>
&gt; &gt; &gt; &gt; +where we expect them to be.<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +Signed-off-by: Alejandro Enedino Hernandez Samaniego&l=
t;alhe@linux.microsoft.com&gt;<br>
&gt; &gt; &gt; &gt; +---<br>
&gt; &gt; &gt; &gt; + Makefile | 2 +-<br>
&gt; &gt; &gt; &gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +diff --git a/Makefile b/Makefile<br>
&gt; &gt; &gt; &gt; +index b3f16aa..9359d95 100644<br>
&gt; &gt; &gt; &gt; +--- a/Makefile<br>
&gt; &gt; &gt; &gt; ++++ b/Makefile<br>
&gt; &gt; &gt; &gt; +@@ -31,7 +31,7 @@ prepare-for-rootfs: examples<br>
&gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; cp -p $$example/host/optee_example_$$example $(OUTPUT_DIR)/=
ca/; \<br>
&gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi; \<br>
&gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp -pr $$example/ta/*.ta $(OUTPU=
T_DIR)/ta/; \<br>
&gt; &gt; &gt; &gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ $$example =3D=3D plugins ]; then=
 \<br>
&gt; &gt; &gt; &gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ $$example =3D plugins ]; then \<=
br>
&gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; cp -p plugins/syslog/*.plugin $(OUTPUT_DIR)/plugins/; \<br>
&gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi; \<br>
&gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<=
br>
&gt; &gt; &gt; &gt; +--<br>
&gt; &gt; &gt; &gt; +2.25.1<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; diff --git a/meta-arm/recipes-security/optee/optee-exam=
ples/0001-plugins-Honour-default-cross-compiler-environment-se.patch b/meta=
-arm/recipes-security/optee/optee-examples/0001-plugins-Honour-default-cros=
s-compiler-environment-se.patch<br>
&gt; &gt; &gt; &gt; deleted file mode 100644<br>
&gt; &gt; &gt; &gt; index 033e48c..0000000<br>
&gt; &gt; &gt; &gt; --- a/meta-arm/recipes-security/optee/optee-examples/00=
01-plugins-Honour-default-cross-compiler-environment-se.patch<br>
&gt; &gt; &gt; &gt; +++ /dev/null<br>
&gt; &gt; &gt; &gt; @@ -1,84 +0,0 @@<br>
&gt; &gt; &gt; &gt; -From 79c826c249001700007a6dffe80c3d61ff4428ef Mon Sep =
17 00:00:00 2001<br>
&gt; &gt; &gt; &gt; -From: Sumit Garg&lt;sumit.garg@linaro.org&gt;<br>
&gt; &gt; &gt; &gt; -Date: Tue, 20 Jul 2021 13:54:30 +0530<br>
&gt; &gt; &gt; &gt; -Subject: [PATCH 1/2] plugins: Honour default cross com=
piler environment setup<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -Honour default $(CC), $(CFLAGS) and $(LDFLAGS) variabl=
es. Without this<br>
&gt; &gt; &gt; &gt; -plugins example fails to build for OE/Yocto.<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -Upstream-Status: Submitted [<a href=3D"https://github.=
com/linaro-swg/optee_examples/pull/87">https://github.com/linaro-swg/optee_=
examples/pull/87</a>]<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -Signed-off-by: Sumit Garg&lt;sumit.garg@linaro.org&gt;=
<br>
&gt; &gt; &gt; &gt; ----<br>
&gt; &gt; &gt; &gt; - plugins/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; |&nbsp; 2 +-<br>
&gt; &gt; &gt; &gt; - plugins/host/Makefile&nbsp;&nbsp; |&nbsp; 2 +-<br>
&gt; &gt; &gt; &gt; - plugins/syslog/Makefile | 16 ++++++++++++----<br>
&gt; &gt; &gt; &gt; - 3 files changed, 14 insertions(+), 6 deletions(-)<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -diff --git a/plugins/Makefile b/plugins/Makefile<br>
&gt; &gt; &gt; &gt; -index 2372b38..ea472b4 100644<br>
&gt; &gt; &gt; &gt; ---- a/plugins/Makefile<br>
&gt; &gt; &gt; &gt; -+++ b/plugins/Makefile<br>
&gt; &gt; &gt; &gt; -@@ -8,7 +8,7 @@ TA_CROSS_COMPILE ?=3D $(CROSS_COMPILE)=
<br>
&gt; &gt; &gt; &gt; - all:<br>
&gt; &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(MAK=
E) -C host CROSS_COMPILE=3D&quot;$(HOST_CROSS_COMPILE)&quot; --no-builtin-v=
ariables<br>
&gt; &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(MAK=
E) -C ta CROSS_COMPILE=3D&quot;$(TA_CROSS_COMPILE)&quot; LDFLAGS=3D&quot;&q=
uot;<br>
&gt; &gt; &gt; &gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(MAKE) -C=
 syslog CROSS_COMPILE=3D&quot;$(HOST_CROSS_COMPILE)&quot;<br>
&gt; &gt; &gt; &gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(MAKE) -C=
 syslog CROSS_COMPILE=3D&quot;$(HOST_CROSS_COMPILE)&quot; --no-builtin-vari=
ables<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; - .PHONY: clean<br>
&gt; &gt; &gt; &gt; - clean:<br>
&gt; &gt; &gt; &gt; -diff --git a/plugins/host/Makefile b/plugins/host/Make=
file<br>
&gt; &gt; &gt; &gt; -index 7285104..76244c7 100644<br>
&gt; &gt; &gt; &gt; ---- a/plugins/host/Makefile<br>
&gt; &gt; &gt; &gt; -+++ b/plugins/host/Makefile<br>
&gt; &gt; &gt; &gt; -@@ -20,7 +20,7 @@ BINARY =3D optee_example_plugins<br>
&gt; &gt; &gt; &gt; - all: $(BINARY)<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; - $(BINARY): $(OBJS)<br>
&gt; &gt; &gt; &gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(CC) -o $=
@ $&lt; $(LDADD)<br>
&gt; &gt; &gt; &gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(CC) $(LD=
FLAGS) -o $@ $&lt; $(LDADD)<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; - .PHONY: clean<br>
&gt; &gt; &gt; &gt; - clean:<br>
&gt; &gt; &gt; &gt; -diff --git a/plugins/syslog/Makefile b/plugins/syslog/=
Makefile<br>
&gt; &gt; &gt; &gt; -index 62d916a..71f5f92 100644<br>
&gt; &gt; &gt; &gt; ---- a/plugins/syslog/Makefile<br>
&gt; &gt; &gt; &gt; -+++ b/plugins/syslog/Makefile<br>
&gt; &gt; &gt; &gt; -@@ -1,3 +1,11 @@<br>
&gt; &gt; &gt; &gt; -+CC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ?=3D $(CROSS_COMPILE=
)gcc<br>
&gt; &gt; &gt; &gt; -+LD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ?=3D $(CROSS_COMPILE=
)ld<br>
&gt; &gt; &gt; &gt; -+AR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ?=3D $(CROSS_COMPILE=
)ar<br>
&gt; &gt; &gt; &gt; -+NM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ?=3D $(CROSS_COMPILE=
)nm<br>
&gt; &gt; &gt; &gt; -+OBJCOPY ?=3D $(CROSS_COMPILE)objcopy<br>
&gt; &gt; &gt; &gt; -+OBJDUMP ?=3D $(CROSS_COMPILE)objdump<br>
&gt; &gt; &gt; &gt; -+READELF ?=3D $(CROSS_COMPILE)readelf<br>
&gt; &gt; &gt; &gt; -+<br>
&gt; &gt; &gt; &gt; - PLUGIN_UUID =3D 96bcf744-4f72-4866-bf1d-8634fd9c65e5<=
br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; - PLUGIN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D $(PLUGIN_UUID).=
plugin<br>
&gt; &gt; &gt; &gt; -@@ -6,17 +14,17 @@ PLUGIN_OBJ&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D $(patsubst %.c, %.o, $(PLUGIN=
_SRS))<br>
&gt; &gt; &gt; &gt; - PLUGIN_INCLUDES_DIR&nbsp;&nbsp;&nbsp;&nbsp; =3D $(CUR=
DIR) $(TEEC_EXPORT)/include<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; - PLUGIN_INCLUDES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; =3D $(addprefix -I, $(PLUGIN_INCLUDES_DIR))<br>
&gt; &gt; &gt; &gt; --PLUGIN_CCFLAGS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; =3D -Wall -fPIC<br>
&gt; &gt; &gt; &gt; --PLUGIN_LDFLAGS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; =3D -shared<br>
&gt; &gt; &gt; &gt; -+PLUGIN_CCFLAGS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; =3D $(CFLAGS) -Wall -fPIC<br>
&gt; &gt; &gt; &gt; -+PLUGIN_LDFLAGS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; =3D $(LDFLAGS) -shared<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; - .PHONY: all<br>
&gt; &gt; &gt; &gt; - all: $(PLUGIN)<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; - $(PLUGIN): $(PLUGIN_OBJ)<br>
&gt; &gt; &gt; &gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(CROSS_CO=
MPILE)gcc $(PLUGIN_LDFLAGS) $(PLUGIN_OBJ) -o $@<br>
&gt; &gt; &gt; &gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(CC) $(PL=
UGIN_LDFLAGS) $(PLUGIN_OBJ) -o $@<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; - %.o: %.c<br>
&gt; &gt; &gt; &gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(CROSS_CO=
MPILE)gcc $(PLUGIN_CCFLAGS) $(PLUGIN_INCLUDES) -c $*.c -o $*.o<br>
&gt; &gt; &gt; &gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(CC) $(PL=
UGIN_CCFLAGS) $(PLUGIN_INCLUDES) -c $*.c -o $*.o<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; - .PHONY: clean<br>
&gt; &gt; &gt; &gt; - clean:<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; -2.25.1<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; diff --git a/meta-arm/recipes-security/optee/optee-exam=
ples/0002-Makefile-Enable-plugins-installation-in-rootfs.patch b/meta-arm/r=
ecipes-security/optee/optee-examples/0002-Makefile-Enable-plugins-installat=
ion-in-rootfs.patch<br>
&gt; &gt; &gt; &gt; deleted file mode 100644<br>
&gt; &gt; &gt; &gt; index 80e6b5f..0000000<br>
&gt; &gt; &gt; &gt; --- a/meta-arm/recipes-security/optee/optee-examples/00=
02-Makefile-Enable-plugins-installation-in-rootfs.patch<br>
&gt; &gt; &gt; &gt; +++ /dev/null<br>
&gt; &gt; &gt; &gt; @@ -1,37 +0,0 @@<br>
&gt; &gt; &gt; &gt; -From f4e5e74548d92258855434b550c58fe44993c148 Mon Sep =
17 00:00:00 2001<br>
&gt; &gt; &gt; &gt; -From: Sumit Garg&lt;sumit.garg@linaro.org&gt;<br>
&gt; &gt; &gt; &gt; -Date: Tue, 20 Jul 2021 14:20:10 +0530<br>
&gt; &gt; &gt; &gt; -Subject: [PATCH] Makefile: Enable plugins installation=
 in rootfs<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -Upstream-Status: Submitted [<a href=3D"https://github.=
com/linaro-swg/optee_examples/pull/87">https://github.com/linaro-swg/optee_=
examples/pull/87</a>]<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -Signed-off-by: Sumit Garg&lt;sumit.garg@linaro.org&gt;=
<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; ----<br>
&gt; &gt; &gt; &gt; - Makefile | 5 +++++<br>
&gt; &gt; &gt; &gt; - 1 file changed, 5 insertions(+)<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -diff --git a/Makefile b/Makefile<br>
&gt; &gt; &gt; &gt; -index a275842..9359d95 100644<br>
&gt; &gt; &gt; &gt; ---- a/Makefile<br>
&gt; &gt; &gt; &gt; -+++ b/Makefile<br>
&gt; &gt; &gt; &gt; -@@ -25,14 +25,19 @@ prepare-for-rootfs: examples<br>
&gt; &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @mkdi=
r -p $(OUTPUT_DIR)<br>
&gt; &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @mkdi=
r -p $(OUTPUT_DIR)/ta<br>
&gt; &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @mkdi=
r -p $(OUTPUT_DIR)/ca<br>
&gt; &gt; &gt; &gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @mkdir -p =
$(OUTPUT_DIR)/plugins<br>
&gt; &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @for =
example in $(EXAMPLE_LIST); do \<br>
&gt; &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -e $$example/host/optee_exa=
mple_$$example ]; then \<br>
&gt; &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; cp -p $$example/host/optee_example_$$example $(OUTPUT_DIR)/=
ca/; \<br>
&gt; &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi; \<br>
&gt; &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp -pr $$example/ta/*.ta $(OUTPU=
T_DIR)/ta/; \<br>
&gt; &gt; &gt; &gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ $$example =3D plugins ]; then \<=
br>
&gt; &gt; &gt; &gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; cp -p plugins/syslog/*.plugin $(OUTPUT_DIR)/plugins/; \<br>
&gt; &gt; &gt; &gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi; \<br>
&gt; &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<=
br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; - prepare-for-rootfs-clean:<br>
&gt; &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @rm -=
rf $(OUTPUT_DIR)/ta<br>
&gt; &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @rm -=
rf $(OUTPUT_DIR)/ca<br>
&gt; &gt; &gt; &gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @rm -rf $(=
OUTPUT_DIR)/plugins<br>
&gt; &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @rmdi=
r --ignore-fail-on-non-empty $(OUTPUT_DIR) || test ! -e $(OUTPUT_DIR)<br>
&gt; &gt; &gt; &gt; diff --git a/meta-arm/recipes-security/optee/optee-exam=
ples_3.14.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb<b=
r>
&gt; &gt; &gt; &gt; deleted file mode 100644<br>
&gt; &gt; &gt; &gt; index f2b5f7d..0000000<br>
&gt; &gt; &gt; &gt; --- a/meta-arm/recipes-security/optee/optee-examples_3.=
14.0.bb<br>
&gt; &gt; &gt; &gt; +++ /dev/null<br>
&gt; &gt; &gt; &gt; @@ -1,4 +0,0 @@<br>
&gt; &gt; &gt; &gt; -require optee-examples.inc<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -SRCREV =3D &quot;e9c870525af8f7e7fccf575a0ca5394ce55ad=
cec&quot;<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; diff --git a/meta-arm/recipes-security/optee/optee-exam=
ples_3.16.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.16.0.bb<b=
r>
&gt; &gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; &gt; index 0000000..b5f6269<br>
&gt; &gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; &gt; +++ b/meta-arm/recipes-security/optee/optee-examples_3.=
16.0.bb<br>
&gt; &gt; &gt; &gt; @@ -0,0 +1,3 @@<br>
&gt; &gt; &gt; &gt; +require optee-examples.inc<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +SRCREV =3D &quot;65fc74309e12189ad5b6ce3ffec37c8011088=
a5a&quot;<br>
&gt; &gt; &gt; &gt; diff --git a/meta-arm/recipes-security/optee/optee-os-t=
adevkit_3.14.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.=
0.bb<br>
&gt; &gt; &gt; &gt; similarity index 94%<br>
&gt; &gt; &gt; &gt; rename from meta-arm/recipes-security/optee/optee-os-ta=
devkit_3.14.0.bb<br>
&gt; &gt; &gt; &gt; rename to meta-arm/recipes-security/optee/optee-os-tade=
vkit_3.16.0.bb<br>
&gt; &gt; &gt; &gt; index 0d37a52..c710e27 100644<br>
&gt; &gt; &gt; &gt; --- a/meta-arm/recipes-security/optee/optee-os-tadevkit=
_3.14.0.bb<br>
&gt; &gt; &gt; &gt; +++ b/meta-arm/recipes-security/optee/optee-os-tadevkit=
_3.16.0.bb<br>
&gt; &gt; &gt; &gt; @@ -1,10 +1,11 @@<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; FILESEXTRAPATHS:prepend :=3D &quot;${THISDI=
R}/optee-os:&quot;<br>
&gt; &gt; &gt; &gt; -require optee-os_3.14.0.bb<br>
&gt; &gt; &gt; &gt; +require optee-os_3.16.0.bb<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; SUMMARY =3D &quot;OP-TEE Trusted OS TA devk=
it&quot;<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; DESCRIPTION =3D &quot;OP-TEE TA devkit for =
build TAs&quot;<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; HOMEPAGE =3D&quot;<a href=3D"https://www.op=
-tee.org/">https://www.op-tee.org/</a>&quot;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; do_install() {<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #install TA devkit<=
br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${in=
cludedir}/optee/export-user_ta/<br>
&gt; &gt; &gt; &gt; diff --git a/meta-arm/recipes-security/optee/optee-os.i=
nc b/meta-arm/recipes-security/optee/optee-os.inc<br>
&gt; &gt; &gt; &gt; index 1506a58..57c64fd 100644<br>
&gt; &gt; &gt; &gt; --- a/meta-arm/recipes-security/optee/optee-os.inc<br>
&gt; &gt; &gt; &gt; +++ b/meta-arm/recipes-security/optee/optee-os.inc<br>
&gt; &gt; &gt; &gt; @@ -10,7 +10,7 @@ require optee.inc<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; CVE_PRODUCT =3D &quot;linaro:op-tee op-tee:=
op-tee_os&quot;<br>
&gt; &gt; &gt; &gt; -DEPENDS =3D &quot;python3-pycryptodome-native python3-=
pyelftools-native&quot;<br>
&gt; &gt; &gt; &gt; +DEPENDS =3D &quot;python3-pycryptodome-native python3-=
pyelftools-native python3-cryptography-native&quot;<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; DEPENDS:append:toolchain-clang =3D &quot; c=
ompiler-rt&quot;<br>
&gt; &gt; &gt; &gt; diff --git a/meta-arm/recipes-security/optee/optee-os_3=
.14.0.bb b/meta-arm/recipes-security/optee/optee-os_3.16.0.bb<br>
&gt; &gt; &gt; &gt; similarity index 76%<br>
&gt; &gt; &gt; &gt; rename from meta-arm/recipes-security/optee/optee-os_3.=
14.0.bb<br>
&gt; &gt; &gt; &gt; rename to meta-arm/recipes-security/optee/optee-os_3.16=
.0.bb<br>
&gt; &gt; &gt; &gt; index 95d82bb..873e964 100644<br>
&gt; &gt; &gt; &gt; --- a/meta-arm/recipes-security/optee/optee-os_3.14.0.b=
b<br>
&gt; &gt; &gt; &gt; +++ b/meta-arm/recipes-security/optee/optee-os_3.16.0.b=
b<br>
&gt; &gt; &gt; &gt; @@ -1,6 +1,6 @@<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; require optee-os.inc<br>
&gt; &gt; &gt; &gt; -SRCREV =3D &quot;d21befa5e53eae9db469eba1685f5aa5c6f92=
c2f&quot;<br>
&gt; &gt; &gt; &gt; +SRCREV =3D &quot;d0b742d1564834dac903f906168d7357063d5=
459&quot;<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; SRC_URI:append =3D &quot; \<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0=
006-allow-setting-sysroot-for-libgcc-lookup.patch">
file://0006-allow-setting-sysroot-for-libgcc-lookup.patch</a>&nbsp; \<br>
&gt; &gt; &gt; &gt; diff --git a/meta-arm/recipes-security/optee/optee-test=
.inc b/meta-arm/recipes-security/optee/optee-test.inc<br>
&gt; &gt; &gt; &gt; index aada243..33eda29 100644<br>
&gt; &gt; &gt; &gt; --- a/meta-arm/recipes-security/optee/optee-test.inc<br=
>
&gt; &gt; &gt; &gt; +++ b/meta-arm/recipes-security/optee/optee-test.inc<br=
>
&gt; &gt; &gt; &gt; @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D&quot;<a href=3D"fi=
le://${S}/LICENSE.md;md5=3Ddaa2bcccc666345ab8940aab1315a4fa">file://${S}/LI=
CENSE.md;md5=3Ddaa2bcccc666345ab8940aab1315a4fa</a>&quot;<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; inherit python3native ptest<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; require optee.inc<br>
&gt; &gt; &gt; &gt; -DEPENDS =3D &quot;optee-client optee-os-tadevkit pytho=
n3-pycryptodome-native&quot;<br>
&gt; &gt; &gt; &gt; +DEPENDS =3D &quot;optee-client optee-os-tadevkit pytho=
n3-pycryptodome-native python3-cryptography-native&quot;<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp; SRC_URI =3D &quot;git://github.com/OP-TEE/o=
ptee_test.git;branch=3Dmaster;protocol=3Dhttps \<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://run-ptest">file://run-ptest</a>&nb=
sp; \<br>
&gt; &gt; &gt; &gt; diff --git a/meta-arm/recipes-security/optee/optee-test=
_3.14.0.bb b/meta-arm/recipes-security/optee/optee-test_3.14.0.bb<br>
&gt; &gt; &gt; &gt; deleted file mode 100644<br>
&gt; &gt; &gt; &gt; index 6367c27..0000000<br>
&gt; &gt; &gt; &gt; --- a/meta-arm/recipes-security/optee/optee-test_3.14.0=
.bb<br>
&gt; &gt; &gt; &gt; +++ /dev/null<br>
&gt; &gt; &gt; &gt; @@ -1,3 +0,0 @@<br>
&gt; &gt; &gt; &gt; -require optee-test.inc<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -SRCREV =3D &quot;f2eb88affbb7f028561b4fd5cbd049d5d704f=
741&quot;<br>
&gt; &gt; &gt; &gt; diff --git a/meta-arm/recipes-security/optee/optee-test=
_3.16.0.bb b/meta-arm/recipes-security/optee/optee-test_3.16.0.bb<br>
&gt; &gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; &gt; index 0000000..03f9c34<br>
&gt; &gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; &gt; +++ b/meta-arm/recipes-security/optee/optee-test_3.16.0=
.bb<br>
&gt; &gt; &gt; &gt; @@ -0,0 +1,3 @@<br>
&gt; &gt; &gt; &gt; +require optee-test.inc<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +SRCREV =3D &quot;1cf0e6d2bdd1145370033d4e1826344585285=
79d&quot;<br>
&gt; &gt; &gt; &gt; diff --git a/meta-arm/recipes-security/optee/optee.inc =
b/meta-arm/recipes-security/optee/optee.inc<br>
&gt; &gt; &gt; &gt; index f02a022..beae366 100644<br>
&gt; &gt; &gt; &gt; --- a/meta-arm/recipes-security/optee/optee.inc<br>
&gt; &gt; &gt; &gt; +++ b/meta-arm/recipes-security/optee/optee.inc<br>
&gt; &gt; &gt; &gt; @@ -26,3 +26,6 @@ EXTRA_OEMAKE +=3D &quot;V=3D1 \<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTEE_CLIENT_EXP=
ORT=3D${STAGING_DIR_HOST}${prefix} \<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEEC_EXPORT=3D${=
STAGING_DIR_HOST}${prefix} \<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&gt; &gt; &gt; &gt; +# python3-cryptography needs the legacy provider, so s=
et OPENSSL_MODULES to the<br>
&gt; &gt; &gt; &gt; +# right path until this is relocated automatically.<br=
>
&gt; &gt; &gt; &gt; +export OPENSSL_MODULES=3D&quot;${STAGING_LIBDIR_NATIVE=
}/ossl-modules&quot;<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; 2.25.1<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; &gt; &gt; View/Reply Online (#3088):https://lists.yoctoproject.or=
g/g/meta-arm/message/3088<br>
&gt; &gt; &gt; &gt; Mute This Topic:https://lists.yoctoproject.org/mt/89404=
067/4354175<br>
&gt; &gt; &gt; &gt; Group Owner:meta-arm+owner@lists.yoctoproject.org<br>
&gt; &gt; &gt; &gt; Unsubscribe:https://lists.yoctoproject.org/g/meta-arm/u=
nsub&nbsp; [alhe@linux.microsoft.com]<br>
&gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt; &gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM5PR0801MB17164CCA6910A06008AF914AFD049AM5PR0801MB1716_--

