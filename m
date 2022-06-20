Return-Path: <stephen.yu@microchip.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8906C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 20:42:49 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by mx.groups.io with SMTP id smtpd.web12.35483.1655757762317723553
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Jun 2022 13:42:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@microchip.com header.s=mchp header.b=pVNk8zXM;
 spf=pass (domain: microchip.com, ip: 68.232.154.123,
 mailfrom: stephen.yu@microchip.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655757762; x=1687293762;
  h=from:to:subject:date:message-id:mime-version;
  bh=9Q/PnkpbD8FywU6BxkjVbms4cGoTxavFBeTIyYyxVAA=;
  b=pVNk8zXMAHKRS6/jVVctuU/ZCAGbFe25h6x6vITJsLk2MNEFSClLZRdF
   HM2UbN72KUaIFRqoRi6BrubFbaM5hQFpVMhgfBVlrMEIze8044isYGs+2
   NPxnWlMi+xlt/sQcPkjXrWu16Tb7e5x9cAhWIUwa2OHvbjTUylDefx01y
   TQWKKNKFc3VJLG/JkWhOLv299xKvATfSN+vKYnettiidFQZYgKB6yf4lQ
   8i9lg0d6rEacivbt3Dg/xUsnbI3f4CbvFasz/HPbTQHuL1t+P0y8JbFZ4
   vZFHegkELtf5OXE3jL0da3fhBq4hi4fmrTlAOk+lzmp6l/QOA9/miEzbx
   g==;
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400";
   d="scan'208,217";a="164246621"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Jun 2022 13:42:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 20 Jun 2022 13:42:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 20 Jun 2022 13:42:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nm6rnbHCWQIszcKMPyF6QwPZ2nfGjpt7pTTrzY17vRT+jlSUbc3x7N4fsuJZdUANbj8//uRc8ZcIW/gdRq/Fw96SPhoHzVXJIFrtiHehEM333CGgp7bu3tddaGUcC6CbAvARgkrIBRET1He2vjF0U7wTNlPkeqK/QH+YxDIy1cZyINmGSf3kFKsRVQcfn93aUxyeetQ1kzyUkyNaJskDAEUf5Qjf/BYElRbUI5VKPpnhbgrB0wuEay3ijMT7qDfyk5PNi5uGbAd08vqsBqLpupX0xxBko8ph8fM9rx6GmsoCwNnfeKH6wYfIdastj4Sfk9Op0Gr7/bJE2jZEsLesRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duVWnPFVJAcWiwvIHcqkHaQsqtjc474uDHWI4VeLz5k=;
 b=GaG5axWTy8t++2XNmiC/ec+EkgTg3BKHQ7Ynj286R3uf0ASvqkkMu9qvp00LaKd7J98MsDbvc9jlinkviwVU7yh6DHwK3auceidQ4MI8qgmA4NRa1kykl90erXcUVfqrwL1AUtUi5FusXSK4/L03iu39KeCz9dB1yneDYFlPf1/Tr+zab56dMQmOa7CnOvipU+vm3/hQzG2sUmX0hGvN+rLdIvHlRaz6N8DObfwrUwiKQwnCLsTWabA6XWMmrvyBLI2SjnwRl8/vJBSRIhfOYJRDFaxH97T5bSgtsgaulIrH0eA1oZo+oIadXtnonr6mZDotRO0+IGhfk3CqhCBmHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duVWnPFVJAcWiwvIHcqkHaQsqtjc474uDHWI4VeLz5k=;
 b=rzfc2Wsnmg7oTwNRKAfDgE3MsG3YLsTDb/QB45ArVKYPBdYFsoJAN5N2OiQZMBVvMlddZKbdBv9H3hkXGoEEL90lDVjKTneQjXZeCyLAmrRR+u7wIxQsgzSGoKYzW+5OJsuy75/DT4IY/xRyAOQbWNHeP3BK3rRPp5+Nz4uucvk=
Received: from BYAPR11MB3189.namprd11.prod.outlook.com (2603:10b6:a03:7c::17)
 by PH0PR11MB4856.namprd11.prod.outlook.com (2603:10b6:510:32::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Mon, 20 Jun
 2022 20:42:31 +0000
Received: from BYAPR11MB3189.namprd11.prod.outlook.com
 ([fe80::3591:df60:bca8:4b65]) by BYAPR11MB3189.namprd11.prod.outlook.com
 ([fe80::3591:df60:bca8:4b65%6]) with mapi id 15.20.5353.019; Mon, 20 Jun 2022
 20:42:31 +0000
From: <Stephen.Yu@microchip.com>
To: <meta-arm@lists.yoctoproject.org>
Subject: ARM cross compiler question
Thread-Topic: ARM cross compiler question
Thread-Index: AdiE5MLDmNP9r+fLQkOfETIUyN9KoQ==
Date: Mon, 20 Jun 2022 20:42:31 +0000
Message-ID: 
 <BYAPR11MB31898D00E13886070423652C8EB09@BYAPR11MB3189.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5130ef95-dcd7-4084-63e2-08da52fd65c2
x-ms-traffictypediagnostic: PH0PR11MB4856:EE_
x-microsoft-antispam-prvs: 
 <PH0PR11MB4856A2BC0B6D3140CA5A038E8EB09@PH0PR11MB4856.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Klqv1kVIw+6VaweR24IH0Dg0IEdOQ+TT2osoPilb3nqaq4/8HzMWNMJO5pwUW0Ifp+Y3TYY04gKmMrM8rmK9CLNja6h6F1KMDrhWvXcN4wRL+IWrpX0Pi7r7AIoBi7QQVC2Cg/SMor81rTQRdR5ZV5IHMOKlSMyXrqCL1dv02wSAuquoA7jzYEJmqUefD7TEuKWyEdiOXtaJfvi8A4OL0/9iLFf5xIpes4Uvr7qu6qhA55WnkwZzAabBc0UuL0tsX0PEWyT2qQMG94vSoShGmZdQLyNFj6gIiDVLtC84ndTW2l8cXYJhPPGs/8p6ZCCM7vxrC5+dizuL8G+Zu9nEf+DSJ6eeA5uHQ0NbPEE+njT9UWpyRb+yIr7asr6Jc0V4vWJd0MtujY1KXqAGKzRhrqiDZgeYdF0X73C7sv5hVIl9SfUkjAJbcjYQBTY53AWDLfp9M40r88CSswY4jQc7UbEdVgaHHgrJZwL54njLDSlQuLew+Xkd7G6uIo8bEXocKwJVT4Juv/FS482c5M+Kg9vy5db6FeIdeIGo0XN9+tx+NugTDLcZr6+4bBcJMGDajBrin0b5yETvaTtD87HChTOFTSAucM03xJcKBKQt9dpCH9c8JosgrqQu8DW9FBQtxKdlMy+EZgOUGQY1qyyNUPxZmm6uhKkJ8FBPfoGpo7HgmFaFq5OUrDXAwrz9yUNRyw6RFRlVgzfF83h5uaaUXw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(366004)(136003)(396003)(39860400002)(66446008)(8936002)(3480700007)(76116006)(66556008)(5660300002)(8676002)(478600001)(66946007)(66476007)(6916009)(64756008)(52536014)(316002)(33656002)(71200400001)(55016003)(86362001)(2906002)(6506007)(7696005)(38100700002)(122000001)(186003)(38070700005)(83380400001)(26005)(41300700001)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?wP7toESGzNaUzuR82+g974SmDZnhHvyzwyB/XixTEBW1L1DkuF2mTfZqjnk/?=
 =?us-ascii?Q?jq/FgbSGeIidhfJ2KvmBL2P9w0ZvH7E+h8/3YpXCT4uh+67E4p1P6I3Cuzdn?=
 =?us-ascii?Q?Mbb6riU79WG8ZO7BEZTMV44HK2yenNbwBLybLNhv4jArd49qK97tXB7cbB8W?=
 =?us-ascii?Q?qzJX/btu++0K8mVi5MBEVIofeC6/IrtzqJBEiTMrTfQ/qaELf06ILV6xa5U5?=
 =?us-ascii?Q?pbjU/n9xpvj/HyvkayCEhV3FHi719/Z0DGATq/R+56IfsG3/U7dpCIKFu8T7?=
 =?us-ascii?Q?Ii2Bo33RZ3ft+KwEWRj9N6X+xI2s9rNokMyA8Rdcia0l8/eAw6IBBxRS5rfU?=
 =?us-ascii?Q?p+QrPhDXr1qEfwKR8kGt2HkFi3UnQ2b4CQDhiVU06qYeDMXZrJZuFk+wgMHw?=
 =?us-ascii?Q?y2v8HooQQn6Q8uxtuc6wX07Jwdoyh5YOuCYoVgNuxVy0MgtCM382oCcO9A1F?=
 =?us-ascii?Q?bs04sgy8U8c1pPTtKPmL+gRzeuh4Ei0UMTIC2ltDiSsnEXTfbwKc9kR+Lu+w?=
 =?us-ascii?Q?fSi3EGpO48clRRInSK4EJaW34phu/xq95m4y6GiMCoE/WfoKDSG6UwCdfIFB?=
 =?us-ascii?Q?5YbhXf6fOCm86zQYAEYBHRHCUNFymKH2Vu5HpXZFvn1H+n+2ndps1JK82I1c?=
 =?us-ascii?Q?2Mwk2OipYQiJa+q4BXbiOdy6Njh/5AtcFt1p7Ligg2OKX0cVz8lotOJJd1hf?=
 =?us-ascii?Q?vO56sifN8WtIoYJ4mthZ9pbPF4eIHYPlzWq7UzcCrdLpiBMVj+o0eNFX4ncm?=
 =?us-ascii?Q?kxszsFSDkXyqADDv/+E+uxzQmSdM9q6O38LsM8y1D2NACzc2oQeXQAqEnn6e?=
 =?us-ascii?Q?7zzBcOHO0fydvFQNBbJdiBJcJHir0SjL5SPu0eK9hlmEMnhEohd/VUYm5Oes?=
 =?us-ascii?Q?yi1Wa+qNnsUlsQrX6RojDWygcEd1eyTP6PHPiyucNrlxW30ExyqwtuebTeuM?=
 =?us-ascii?Q?Yu9CflNwnuWrSmptMWa5fdsDg7hAhPrcNpq7f0pL31GWea+2OGLe/iaJ1A8I?=
 =?us-ascii?Q?PYOJUugxjGUjW63z+8NIysZ7S00wwxu9+hfm14tUwq+Rrmo86RrbJtuZ7/iS?=
 =?us-ascii?Q?0bNS2ssloFRjtpj8fe483AX2p6aT6RaBqy2mDzb0g4M4GkrAgV3uOWgLCFWa?=
 =?us-ascii?Q?28Ax5yehuDD7Yq/H4yrYjfp3A2KD4/bfs4vbX/VpHIQ4VBrmxtzfFF858MKT?=
 =?us-ascii?Q?DDtVVRQnLTvu8eK2Rw+MA8Vl8BVxO/czIk95Aqbdi5c49dcq/orIBmv7CVIE?=
 =?us-ascii?Q?ihJGqNIEJh3NjlDvz0tMbM+1M2pxjS4AxfgSwYDKtHjWi8mesGGob340Isi/?=
 =?us-ascii?Q?9h5RuW8c6YXWLoQU0pgzg7o/WuwfkYQpLwEjBkQHjbJC5ETgsEYALSj4FuNw?=
 =?us-ascii?Q?jBb8BAPKvuIExFf7cm6lDa7CtZIIX3HZKUmyyzld477l5oZsGpcwJhpWxeLA?=
 =?us-ascii?Q?UK2ssrS45Dsp9QTbzQXD3VncfwmafZhTaSRDreA9qYCMmCEIVP99W51CSoNA?=
 =?us-ascii?Q?n9D1AADP8w9teZoRJ7bxpyNTcOs6qaBqVrCbabjSd8FWQhdq7zdvETUXVt6W?=
 =?us-ascii?Q?8GS0zsluqrS5RIBuO2GzFYDrCKyYDLPdu8bMESO1KkTZbSoOc1WKMt5D85BM?=
 =?us-ascii?Q?2dtN8UjA/HHXax2mz4oD+KoLKaj5nL4L1m90ouiC+Ac20TP5X0SiaK3jGAE1?=
 =?us-ascii?Q?CV2M6HG4GqFG+q/aJ5DiMJCe6jmwrmDiOToMeA+tsxBcbVs/0T3+gMNrxEHw?=
 =?us-ascii?Q?jgLFThRwfA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BYAPR11MB31898D00E13886070423652C8EB09BYAPR11MB3189namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5130ef95-dcd7-4084-63e2-08da52fd65c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 20:42:31.3475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 B+jrQeeZh7x7KRSZnCNlB9bSiCnDnEHeYcD6C/S1X9kefHaagAu5ebJFelJRnuz/bpFrVVOXEU974PfqzH1oHsyPCopPyh6ZbiePmvHgd0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4856
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Jun 2022 20:42:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3519

--_000_BYAPR11MB31898D00E13886070423652C8EB09BYAPR11MB3189namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have the following C source file arm_cast.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

int main(int argc, char **argv)
{
    uint32_t value =3D 0x1254FEBA;
    uint16_t v1, v2;
    uint16_t a[2];
    int loop;

    v1 =3D ((uint16_t *)(&value))[0];
    v2 =3D ((uint16_t *)(&value))[1];

    printf("value: hex -> 0x%x, dec -> %u\n", value, value);
    printf("v1: hex -> 0x%x, dec -> %u\n", v1, v1);
    printf("v2: hex -> 0x%x, dec -> %u\n", v2, v2);

    for (loop =3D 0; loop < 2; loop++)
        a[loop] =3D ((uint16_t *)(&value))[loop];

    printf("a[0]: hex -> 0x%x, addr -> %p\n", a[0], &a[0]);
    printf("a[1]: hex -> 0x%x, addr -> %p\n", a[1], &a[1]);

    return 0;
}

Cross compile from x86-64 to ARM
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
syu@ubuntu-virtual-machine:~$ echo $CC
arm-poky-linux-gnueabi-gcc -mfpu=3Dneon -mfloat-abi=3Dhard -mcpu=3Dcortex-a=
9 -fstack-protector-strong -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security=
 -Werror=3Dformat-security --sysroot=3D/opt/poky/3.1.7/sysroots/cortexa9hf-=
neon-poky-linux-gnueabi
syu@ubuntu-virtual-machine:~$
syu@ubuntu-virtual-machine:~$ $CC -o arm_cast_o1 -O1 arm_cast.c
syu@ubuntu-virtual-machine:~$
syu@ubuntu-virtual-machine:~$ $CC -o arm_cast_o2 -O2 arm_cast.c
syu@ubuntu-virtual-machine:~$
syu@ubuntu-virtual-machine:~$ ls -lt arm_cast_o1 arm_cast_o2
-rwxrwxr-x 1 syu syu 11636 Jun 20 13:24 arm_cast_o2
-rwxrwxr-x 1 syu syu 11636 Jun 20 13:24 arm_cast_o1

Run the binary on target
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
root@Bev8040D:~# uname -a
Linux Bev8040D 5.4.124-altera #1 SMP Wed Nov 10 15:47:46 UTC 2021 armv7l ar=
mv7l armv7l GNU/Linux
root@Bev8040D:~#
root@Bev8040D:~# ls -lt arm_cast_o1 arm_cast_o2
-rwxr-xr-x 1 root root 11636 Dec  7 20:35 arm_cast_o2
-rwxr-xr-x 1 root root 11636 Dec  7 20:35 arm_cast_o1
root@Bev8040D:~#
root@Bev8040D:~# ./arm_cast_o1
value: hex -> 0x1254feba, dec -> 307560122
v1: hex -> 0xfeba, dec -> 65210
v2: hex -> 0x1254, dec -> 4692
a[0]: hex -> 0xfeba, addr -> 0x7ebf3b88
a[1]: hex -> 0x1254, addr -> 0x7ebf3b8a
root@Bev8040D:~#
root@Bev8040D:~# ./arm_cast_o2
value: hex -> 0x1254feba, dec -> 307560122
v1: hex -> 0xfeba, dec -> 65210
v2: hex -> 0x1254, dec -> 4692
a[0]: hex -> 0x0, addr -> 0x7ede7b88
a[1]: hex -> 0x0, addr -> 0x7ede7b8a

The issue was that with -O2, a[0] and a[1] were 0, which seemed incorrect i=
n my opinion. I did the same experiment with $CXX. The result was correct. =
For both -O1 and -O2, a[0] and a[1]  had the same non-zero value. Note that=
 the target runs Dunfell distro. Again, I tested the Honister and it seemed=
 having the same issue.

Any idea and suggestion?

Thanks,
Stephen


--_000_BYAPR11MB31898D00E13886070423652C8EB09BYAPR11MB3189namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">I have the following C source file arm_cast.c<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">#include &lt;stdlib.h&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">#include &lt;stdio.h&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">#include &lt;stdint.h&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">int main(int argc, char **argv)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">{<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp; uint32_t value =3D 0x1254FEBA;<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp; uint16_t v1, v2;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp; uint16_t a[2];<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp; int loop;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp; v1 =3D ((uint16_t *)(&amp;value))[0];<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp; v2 =3D ((uint16_t *)(&amp;value))[1];<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp; printf(&quot;value: hex -&gt; 0x%x, dec=
 -&gt; %u\n&quot;, value, value);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp; printf(&quot;v1: hex -&gt; 0x%x, dec -&=
gt; %u\n&quot;, v1, v1);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp; printf(&quot;v2: hex -&gt; 0x%x, dec -&=
gt; %u\n&quot;, v2, v2);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp; for (loop =3D 0; loop &lt; 2; loop++)<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a[loop] =3D ((u=
int16_t *)(&amp;value))[loop];<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp; printf(&quot;a[0]: hex -&gt; 0x%x, addr=
 -&gt; %p\n&quot;, a[0], &amp;a[0]);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp; printf(&quot;a[1]: hex -&gt; 0x%x, addr=
 -&gt; %p\n&quot;, a[1], &amp;a[1]);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp; return 0;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">Cross compile from x86-64 to ARM<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">syu@ubuntu-virtual-machine:~$ echo $CC<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">arm-poky-linux-gnueabi-gcc -mfpu=3Dneon -mfloat-abi=3Dhard=
 -mcpu=3Dcortex-a9 -fstack-protector-strong -D_FORTIFY_SOURCE=3D2 -Wformat =
-Wformat-security -Werror=3Dformat-security --sysroot=3D/opt/poky/3.1.7/sys=
roots/cortexa9hf-neon-poky-linux-gnueabi<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">syu@ubuntu-virtual-machine:~$
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">syu@ubuntu-virtual-machine:~$ $CC -o arm_cast_o1 -O1 arm_c=
ast.c
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">syu@ubuntu-virtual-machine:~$
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">syu@ubuntu-virtual-machine:~$ $CC -o arm_cast_o2 -O2 arm_c=
ast.c
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">syu@ubuntu-virtual-machine:~$
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">syu@ubuntu-virtual-machine:~$ ls -lt arm_cast_o1 arm_cast_=
o2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">-rwxrwxr-x 1 syu syu 11636 Jun 20 13:24 arm_cast_o2<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">-rwxrwxr-x 1 syu syu 11636 Jun 20 13:24 arm_cast_o1<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">Run the binary on target<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">root@Bev8040D:~# uname -a
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">Linux Bev8040D 5.4.124-altera #1 SMP Wed Nov 10 15:47:46 U=
TC 2021 armv7l armv7l armv7l GNU/Linux<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">root@Bev8040D:~#
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">root@Bev8040D:~# ls -lt arm_cast_o1 arm_cast_o2<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">-rwxr-xr-x 1 root root 11636 Dec&nbsp; 7 20:35 arm_cast_o2=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">-rwxr-xr-x 1 root root 11636 Dec&nbsp; 7 20:35 arm_cast_o1=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">root@Bev8040D:~#
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">root@Bev8040D:~# ./arm_cast_o1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">value: hex -&gt; 0x1254feba, dec -&gt; 307560122<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">v1: hex -&gt; 0xfeba, dec -&gt; 65210<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">v2: hex -&gt; 0x1254, dec -&gt; 4692<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">a[0]: hex -&gt; 0xfeba, addr -&gt; 0x7ebf3b88<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">a[1]: hex -&gt; 0x1254, addr -&gt; 0x7ebf3b8a<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">root@Bev8040D:~#
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">root@Bev8040D:~# ./arm_cast_o2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">value: hex -&gt; 0x1254feba, dec -&gt; 307560122<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">v1: hex -&gt; 0xfeba, dec -&gt; 65210<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">v2: hex -&gt; 0x1254, dec -&gt; 4692<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">a[0]: hex -&gt; 0x0, addr -&gt; 0x7ede7b88<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">a[1]: hex -&gt; 0x0, addr -&gt; 0x7ede7b8a<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">The issue was that with -O2, a[0] and a[1] were 0, which s=
eemed incorrect in my opinion. I did the same experiment with $CXX. The res=
ult was correct. For both -O1 and -O2, a[0] and
 a[1] &nbsp;had the same non-zero value. Note that the target runs Dunfell =
distro. Again, I tested the Honister and it seemed having the same issue.<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">Any idea and suggestion?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">Stephen<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_BYAPR11MB31898D00E13886070423652C8EB09BYAPR11MB3189namp_--

