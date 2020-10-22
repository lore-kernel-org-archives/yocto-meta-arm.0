Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.42])
 by mx.groups.io with SMTP id smtpd.web10.6503.1603349470918302139
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 23:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=JV5KMl6A;
 spf=pass (domain: arm.com, ip: 40.107.8.42, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MgQ3h4HQK37ObCMWX9oRf44jHbOVID4NMH3U8a6/28=;
 b=JV5KMl6AUx7Q3dmoqawf2biYs4Rx2ERMdeXrqOmbP6oQ02jP9NRMFbFDdj4npFkab7i4dOw0Rm3nSxMPEwNDg3akoLf/4Sj6AA04QjoWmdjB+s6ZR2595pTYv/GDbPJIQdcWLGB6XYRBrEhYl4JCt8quVuOiw+NbSUtOSTemAeQ=
Received: from AM0PR02CA0088.eurprd02.prod.outlook.com (2603:10a6:208:154::29)
 by AM6PR08MB4248.eurprd08.prod.outlook.com (2603:10a6:20b:b5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 06:51:08 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:154:cafe::d2) by AM0PR02CA0088.outlook.office365.com
 (2603:10a6:208:154::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Thu, 22 Oct 2020 06:51:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 06:51:07 +0000
Received: ("Tessian outbound c579d876a324:v64"); Thu, 22 Oct 2020 06:51:06 +0000
X-CR-MTA-TID: 64aa7808
Received: from 8f82086452f3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9EDB64AB-6C0E-45FA-96DA-8BE0B93D86A9.1;
	Thu, 22 Oct 2020 06:51:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8f82086452f3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 22 Oct 2020 06:51:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3B0DM4lyJD2OzjDlFU1zMre+rFo5iwHdBHZwH7W3KwhqtpT6ZXdmwYxhiO/Ox2GHrRAbcC/KgwVSocJ/RddBhXrdmD0BlqdxAbOHEOLlLxYTBO1S3HssZdKejby2QQ99vpjj28NjOxZs0WBeRZgaLNZUOayv/+TBXY5Zdu5lWvrcNP9/kb+TB9stcFubIIbGR5GK21WL0wlzLom5HTctELD4W/1/uueTnUcjUWIhT4KV01csMr+KXkfjpbJHnSt0+Zd8CYSMiJi93buE/kAp78OSVkVwaFTdvRY3PfEw36zNyM9UGz+YM1+aKV9scN+tXkDb/8GGPKCwGbpGkegrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MgQ3h4HQK37ObCMWX9oRf44jHbOVID4NMH3U8a6/28=;
 b=VJITXe8ddqLWRv7W+O6k8BwuK5nR6DUHxXxfZynD1osouvFe4CuaM6yAFiJX27bK8QPUcxyMTEA/8IMzMh+gl86ddpNSSxWCTXoiZY+fA2GbV/9q/H1f3fuB9a28fuS9zJXuKq6/OSuuy/U0Gpy64RCcyLWQIfu9msp2/9ZcSMN+E2uRfQhW1S9Qe5npoTAbIUZVFYJvZs8YAEgtXcSdpxxqaM1Bp46XbAk3t9HBGRNqhqXYJFPvxoqovh/NtuOs+4ExeqIKeyoc29iiq4sbskAJFxV34QFX1mMZpAdaLA4UWbvw+CQ+Amx/BPOV43dB1F8piz5g74MdMh6E9XwofA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MgQ3h4HQK37ObCMWX9oRf44jHbOVID4NMH3U8a6/28=;
 b=JV5KMl6AUx7Q3dmoqawf2biYs4Rx2ERMdeXrqOmbP6oQ02jP9NRMFbFDdj4npFkab7i4dOw0Rm3nSxMPEwNDg3akoLf/4Sj6AA04QjoWmdjB+s6ZR2595pTYv/GDbPJIQdcWLGB6XYRBrEhYl4JCt8quVuOiw+NbSUtOSTemAeQ=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0802MB2500.eurprd08.prod.outlook.com (2603:10a6:203:a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 22 Oct
 2020 06:51:00 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 06:51:00 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Ross Burton <ross@burtonini.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/2] arm-autonomy/xen: Backport improvements to xen 4.14
Thread-Topic: [meta-arm] [PATCH 1/2] arm-autonomy/xen: Backport improvements
 to xen 4.14
Thread-Index: AQHWp7mfYGR6lHT1Z0Oio+mCFoxLQamikXAAgACeVCA=
Date: Thu, 22 Oct 2020 06:51:00 +0000
Message-ID: 
 <AM6PR08MB34610033368BAA8561D076F8921D0@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <a151eaf39d450b9461ea9d259206956bd5a9fd49.1603291792.git.diego.sueiro@arm.com>
 <CAAnfSTsa++N5NcfAR+mi0CN39AuZMMu8Vv6tHju7sUXM3Yb=NA@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTsa++N5NcfAR+mi0CN39AuZMMu8Vv6tHju7sUXM3Yb=NA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: F828AE4508854748BA9D8447803D060B.0
x-checkrecipientchecked: true
Authentication-Results-Original: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [90.219.69.79]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 89c79b65-f0b0-4ad4-3c5a-08d87656da1f
x-ms-traffictypediagnostic: AM5PR0802MB2500:|AM6PR08MB4248:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4248E553C91EB31EE0A687FD921D0@AM6PR08MB4248.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4303;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 iKiYIEHek7L9y4x5gPqTtGSzJZLUVFp1TmpwVkgPd8IQ0J0+EQHxpK16SrsJyP0BBn5b4yFdHmruB0wpnrWdOc5ZuLoKuEM9GkWHIlrqDHyXbx3hOVXITemwMunGO/BV8CjljGkRlc1bjv0SRgWZ1+Uc0uGWclzVKVIAt+U6CY+u8HKvDZjkp4hKj1oX05osi193iMsvEmXTh1vOfBybvj1ExxKAasMg2a4F6n8VGlAhozI4715F9ZtnMfDh+JKbBrl4K9f9Uu0OmqzbYpHDM8C/pAco+0syqtjlvCGZFzaUgzwkoZk0My2+XLhoOXu0/J9DLait2HIrNwBDgsC7+Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(4744005)(55016002)(6506007)(26005)(33656002)(54906003)(8936002)(4326008)(9686003)(66476007)(5660300002)(86362001)(71200400001)(83380400001)(8676002)(66946007)(66446008)(316002)(66556008)(64756008)(6916009)(7696005)(76116006)(2906002)(52536014)(186003)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 Bl1BB8rpcnFFtuOw5p3t0msEpcO1MDPOjym4NcW7tvJeJNnjbPhnq4xZ0Cq4AmdYWFLkad6Mp7Xd4/spUAyEM5jq7P+2I+4j/9K9MIpRVh9952IQsJ0lf2H9vf8/EhmhYEhkgACOrbEcthfnTxP4AqGH9EaF6eS1vS+wWAspckHORLXDctuLCB+a5TfAlFdWlmO5tIPTjycy35Atgp91LGW+7MZpyBTWtKbJYCI2/l7Imgyv7qkJQ9Vf0WAffn0pLGHQkuUZEbtb/uWawnNcj8WzlK7gN8uTvXUYP5reKax3vCNVXQ24XRjqoWCW9FRvTNs10RHdQjD/byH8wOfPML1nzewDNmemR/y7W1MHR68QuFIPcuNCtA5apR3fbS5O2HilepkQaj9A5OcyMhVifCGfJ+6n6915hI2sP6mv1gL/QVE8eiZV/0YM76wfZOHtFWrQdrDcALaMzaDWAIuQcH4KdxrERQ719+bxUIP7YX6R3bp0e0EfM5Btt/p/dURG9j+l7QPewwPcVlw8PRXlv5ZXAzVcBj+nKs9ZK0PlcIV59V0kys9bI3ZkDgg1WCmN3Z3+uNoRDm68VhEGO+ROXeckZiEYrQuXZV63Sk+hZ7EVuxR+7njuuXLoElSNoZLWG5f50G9EKMlndic+7pGxqg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2500
Original-Authentication-Results: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	66022c7e-eb30-450d-f745-08d87656d669
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	toX+rL+9/hDFzol5xIwjTcL1Ie51poR1gjUynJsmA7Z5g4CBt4EpMa57LSPynN+XRs+likfXYb1UaK1aRNqbew1MEh+AowOQ42bAqEt4ioL4bvG8vyooHuRirSa8dPdymmuDV6ztoMqR+PvmsaeSEJSM5eNOuv7fuGNuxffYOcph+H1FRqDg8DuKI1XI7/wL2Cnj35KrIys1FACP06l7N+MN98+9w7TOdUPguSzZDdvTefOx183zUoE4Uu/ybGInqFm5+6QHly6HEvqWgeIMbJQbDVM853BsBzXwPJ96aLRTOvuHNdG3dToEgUnQc/zmli954nMagLstIfQlGeGKCY4ZOKvARBg21Hd6EJqiVTCDRdc49ATUiZPBCwU0bZiz9P6T8QyIVtfsLdmqtCUyLw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966005)(6506007)(8936002)(54906003)(478600001)(6862004)(316002)(26005)(33656002)(4744005)(186003)(81166007)(47076004)(336012)(82310400003)(9686003)(70206006)(82740400003)(86362001)(52536014)(70586007)(7696005)(83380400001)(2906002)(356005)(5660300002)(4326008)(55016002)(8676002)(36906005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 06:51:07.1050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c79b65-f0b0-4ad4-3c5a-08d87656da1f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4248
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogUm9zcyBCdXJ0b24gPHJvc3NAYnVy
dG9uaW5pLmNvbT4NCj5TZW50OiAyMSBPY3RvYmVyIDIwMjAgMjI6MjQNCj5UbzogRGllZ28gU3Vl
aXJvIDxEaWVnby5TdWVpcm9AYXJtLmNvbT4NCj5DYzogbWV0YS1hcm1AbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZw0KPlN1YmplY3Q6IFJlOiBbbWV0YS1hcm1dIFtQQVRDSCAxLzJdIGFybS1hdXRvbm9t
eS94ZW46IEJhY2twb3J0DQo+aW1wcm92ZW1lbnRzIHRvIHhlbiA0LjE0DQo+DQo+T24gV2VkLCAy
MSBPY3QgMjAyMCBhdCAxNTo1MSwgRGllZ28gU3VlaXJvIDxkaWVnby5zdWVpcm9AYXJtLmNvbT4g
d3JvdGU6DQo+PiArVXBzdHJlYW0tU3RhdHVzOiBiYWNrcG9ydA0KPg0KPlVwcGVyY2FzZSwgcGxl
YXNlLg0KDQpWMiBzZXJpZXMgc2VudC4NCg0KPg0KPlJvc3MNCg==
