Return-Path: <johnnie123@myfrontiermail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4884C38A2D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 20:42:33 +0000 (UTC)
Received: from sonic302-3.consmr.mail.bf2.yahoo.com (sonic302-3.consmr.mail.bf2.yahoo.com [74.6.135.42])
 by mx.groups.io with SMTP id smtpd.web08.2949.1666384942522620933
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 13:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=dGpPZoSN;
 spf=none, err=permanent DNS error (domain: myfrontiermail.com, ip: 74.6.135.42, mailfrom: johnnie123@myfrontiermail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1666384941; bh=fvE22qGJgah8HiK+KORG/JMmoxboB7an+AOtT/NpYeY=; h=Date:To:From:Subject:References:From:Subject:Reply-To; b=dGpPZoSNVM05PZhYhWAn5fO0HH/mbj63qxcM/+EQvDj4lXqcyQQUypu/QfzLVc1S6OcI/lqMFPByX58C0kOw2o7iSVFtNTxe7MJyZ4OganUg6c0iFwz1p1eM5kq41+M9Gb6kSrpbE9j1lKxYOlBdtV7oXqlAAv8/AJ6wv/IdqT7VHTFDsxybpgQDmBJEb1MrA/x5dAIC581+y697UsrkObBlLE6QuoqQnVr+lpih3fR4+thQEumfBmkIJOCKS88KLFK3+hn4mqw7Tcq7MRRr0cnCMzWpfAbUO//RRNFoPAQOimgxBOmmGXlABdpbjGtd86+YivC2L2OdjOOkny5uwg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1666384941; bh=6EQRoJQVfErA5IRFiisfIq05uriVt0L82m2hF4lx/B7=; h=X-Sonic-MF:Date:To:From:Subject:From:Subject; b=TNWy7lKFsOTyxGEfr/lwD/KOfT52Rr4Opi+z5l3HkKY/yDSbdRoVSOEo1NbTt1TY2L7eUtAsQznennuSYcRDAN9UtwTzk+E/3UQd7C24cqgP4vj7h/sdttGud97VauA0M2LkHL64MOmLlAN4+pTyGiy0XpYyT7jsOwLxPh73z52phfX5qX4nX3vofXt3GaN9r4/u+5WY1SB2oOZd/01EpbeCpyqvPgEUpIHzqqEptEZ3HpJTWfm6aHExw2p8+g/NkAt0WfDth1aMujjIC4r6eJ1OcLUOhDb/MM0lGzDCure8STUvQXx9rZyUK/lyUmvaaT9aP4trGx4DlNUMzZNhlg==
X-YMail-OSG: RiUrHrwVM1kMxZPmm6JEpxXrGKkb7u.L7vcDZteWzz1BtjheHzhHhX_1oajwFIZ
 UA4Wg0EgBFtopU9095.gtLNP4Bvtup3Q15nDTiIup5VPJMV7SVf_xEfIFgMY1eGNnlx61ERffcDo
 eZyB0vVq5X2MuLEro_a1eqU38i4CzaAB3DfenjFI5gYC2X10XuBkETaRYFTeMF2Ek1dzHc87_0cL
 SQe1cmobPB94aDwMV68sjBCbl2aS_QMkmgzeK.2FgPflkc1qu8ZUtYu1.1kVbx7oEUGLFbsQfSWl
 jR6MZSfBR8.INBgXksHEh7.ZfhhrOB4BHB9tCIbEndhwCkwKkvReIq4HycAbNaL9uRwAjODwxHW.
 IDtVlC_v2to3taZlj9.MpUbHY1yIXuFDIjNIo4LQ_PvSRiAHzNBn57X7no7rAfaX36k54lOWxKVF
 FvvgsSABavOIKirwvCfjoSfXexmiGSDUBY0jtyDHTY23HYqpXOQYAULSbP8Q6kci3EpKEbTUMeiv
 gJBo1WCrw9ia.H.RaxsT8qxbO5W6gZRwMoR8cX_70Dq2Jp58uzqmWtLLi0reNy60nZ1LQ.AUwF1A
 rUnLO0vktFDrkBvX6WMi7OTGrij51u_CVsrfmGWg5s7KkP85Wq6xmm2z5iAyH5zqfb4vmAoHEjfu
 84i.rxNfHLHjCY3DN0zZ.MKxUKZkzjEX8WzsAtDFpCQl2o4JrIpgtbyifC2JpHB3RQnMDIiJYQEt
 B81GLIddMvHaFXpVXEi9iMf9lxe.qDjbDJmoMB.z_yxFJfzFGf2WG27w1GBJFkwLQCg2nkmHkEd6
 b744bhBcBtSUN8vTsrpsoh38QyuAequS9JlCT_zk1pAS70fT3NalrIHgH9248jeHcy545i0v46Mk
 T3_4E72eQGDCiAGBginafX0Dyxbx_5N4mDdwkXq_Mtzz8R0ia.D8P6YnS1uVF0zIXw3t0IeZHQGY
 YfEXWxUCl9._vc7V78yVUcA2fFN3XHypt.BsBFJP9K6DR3lBYroSyhZu0Wonsz6xvQmcb.GsPme9
 gLsWK6LCZ5yke3maQnSTlkaUsb.QCRU8JPzN.geU2lZQUWv4qlof83EKp2oSLNgJLEb84Z0X0Mh7
 MtzADy9SiGvfr8l1Fu7pYo7eSQ9Jc9fK0cPJ6NPdUkiG_8cHewx.cDOEY0ldauVgFKWJXAjeuwMk
 AlPGs8Nu0jOH_i.MWOZw8reIa_nFCb4CVhUbqKGSue1N3KWKJWlApdyulpcib1kueplAhzvILrxN
 UUF11AwNtZgYRNWb.uEgevogXARkeKYWv0gxp0UIKIOFCTMHzmsCOy4LIXQzAOePdOUTd.pBtccB
 r2LTttF48yqBDKEr6_FpOuuBreCpfGCajwvC0rvvEIy9TzzNoysdFJEEpILP8.iTMyZq3thdMYcb
 ngcfjA25nbxenOrmRdaao4KIX_bsz3mV.nqlmoDnyIWTxS38XP6O82Nfa97vLvw4FWv3wIgOIGyg
 jAx6lGgxjKojFMQoSDEIdc6CibN3_M_NYGuCP_5PzapRVLLOvKI7EEjxfGo2NDLRQiE8gnct.KTr
 OD4.gZWUtX1LbsJkuwbDjZHmyEkqRkxEYoFrHKIp6cFEP1_y3kCmNbVYRL78bXRomMRrpCSsCese
 ddVI3B7AAS5eCL9tLs1CHDecwUCZanin1WLaetvtK1RVCH9JuV0gz0ptaqI1JIonS537tHfcAcTb
 anVHDJbPa1muFAzQQL0M2IZ7_8iNUrrHD9KtsGxcN2TOqdNsxMv5_KPOrNsay584PYG2a.Hgwnb6
 G83e5Nym7o3pggexXD2FSxhG8K2o7FvyZYtbdSVWq1rfu10W.PL9BYebXnrXozWWXSAq16CbU0nD
 XaJU3JQRvhS_YIQk60SJAUTGqhC7AlhlK4Xz1jUPlxE6kLTpBsvb7ZHLb9nDyi6O7WvcoNK8W5sh
 c9XFf84UNFyeomdZXczg_5Q7Bc2yxLP6SxaQxJr7wjmxpQhFqOMSaKTjxFnJmmscC35HjsriQMG5
 X6oHBFV8Sqhb.H1QXfZvPgxLMg4bxnwuOPDxoRN0WUsOY3kzjb840oZQl8MNTrs_rgQe9tyt8Ay4
 vWaDL9cinXzi1Tlr5Uz5BOGaoqBqAJ0_YTY1OLNnNC_3jK.8UlMIwxxVl4WhL3.ZGU3LLedacgg1
 doQkKhtxzHhA6vmZd0O17yE3RiRRvLw_h5FxmUIgd2_d1dng49KMx4gaOEi9D_2eP_szqxbpTHrE
 IchiKnntLtdvRQMjsDmS8M1_BoRigUz62gp8CHKzNVSY2Bih.PQXNJz02.3M10Q0-
X-Sonic-MF: <johnnie123@myfrontiermail.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.bf2.yahoo.com with HTTP; Fri, 21 Oct 2022 20:42:21 +0000
Received: by hermes--production-ne1-c47ffd5f5-8c2cz (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 893ca864618820a65688619177f0610e;
          Fri, 21 Oct 2022 20:42:17 +0000 (UTC)
Message-ID: <ec04cba2-f9ab-811a-a878-051297a31397@myfrontiermail.com>
Date: Fri, 21 Oct 2022 13:42:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: meta-arm@lists.yoctoproject.org
From: Johnnie Peters <johnnie123@myfrontiermail.com>
Subject: Yocto ARM ISO build.
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
References: <ec04cba2-f9ab-811a-a878-051297a31397.ref@myfrontiermail.com>
X-Mailer: WebService/1.1.20754 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 20:42:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4005

Hi,

I would like to build iso and live images for the aarch64 type. I found 
this patch that claims to fix this for luvos 
"https://ml01.01.org/hyperkitty/list/luv@lists.01.org/thread/FPNEKQDRH2KWC7TJ3E26F47ZY3PELH2X/".

This was posted in 2015.  I have found no other information with google 
on enabling these image types for ARM64.  Does anybody on this list know 
of a patch that will work with the kirkstone release?

Thanks,

Johnnie



