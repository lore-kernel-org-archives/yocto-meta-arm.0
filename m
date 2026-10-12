Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E2BCA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:13:23 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12827.1791810795396504792
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Oct 2026 06:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=qohAd0N9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-533930955a4so18522821cf.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 12 Oct 2026 06:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1791810794; x=1792415594; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jebMZv99Sa7PbCAwSirBXznm0dCCCU+zWMN16QDXOrc=;
        b=qohAd0N9Gkaj254rvOLor7CvA1zkZcm0SPgUXsbpLdvVKTlCZgBHk2MFTSPa3yOkp/
         Q2bVh3tFgPzhjW7pCoXxcQQxwJ3xL1OIKH+Vw3GDhoXVPgGbyiQPw2QFtcmk9tftW3m9
         ICu+sxKzlF3NNTe5UoJR5ytQsToOFH3RwEMv1EVoxyPjHHhs+vHh2kxgjrNDga9f93Ps
         ExeVvALe8hBP+zjpTclCaCITw3c7k2fxIuuz5e3LO2JAVdMr43Uj4olrbovkrOla1YvZ
         bLisvp8wE3fjg2hn7kc15yLVZDj/w6n6x6MvoyROSUn2HSAMFviXyqgHbs+tJy12Mf0a
         KIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810794; x=1792415594;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jebMZv99Sa7PbCAwSirBXznm0dCCCU+zWMN16QDXOrc=;
        b=BE2itWEjVWGquduVOHSHJhriilVU8YFCyfL6AdiMEuajORT225cT7CTwQKJGx4YLLb
         Q6kgh/SjMzxG525n6ScoUTBNcWBum3fJ8mjCUtA8akACnsnEQsRHELX7BgS6nmgYAgJK
         C2xtaL2JqVnWl7WHU1INC1aSbbPbr+j/I0hHyOABzR0ZQYiwTLoTdCQWH+rik44UJKi5
         QbHmWea10xdRmvlj0eMHMBGMLWF3QxTENIN3UH4SkesBcfauoDs2rspC9ingpWtFKyxb
         f/zA/Df6qfJ881kf7BMATJGW3exIgsaWktksrLkcGB11RKeywuLac02c1HUsWEJ/nAkm
         xQrg==
X-Gm-Message-State: AFq9FYLFkSAqNaL4mAZKRovrvfwvxDqaEWvg640ZGGKBiE92EQ15eDgk
	Chol7C3GHkIeRcpkaAtbVHpi9YhjI6dmjusu/3a772wBsXHLvhx8job1ksK8BkLvq2hvkxtO8FE
	1n35xkg==
X-Gm-Gg: AYBFou0mHhr9+AiJaiXp2olNCId/Jm0F7OXI4dEoXjsXgW7dYMDCjqjq4IUCrxDcRvj
	OohPOnkvHr8xJKW0EfpQJO9Nwu4j75sBn8P5ibAmu1Ztc1FLZEFgc7dmdV/axx8ghMwawNy8Qoi
	KHlf/xQl86wJviBoEssTx69V3zZr9+CtZMjv9/4cRoi+cxmsbzINhmrInOpBAgna6/bn9yiQtvI
	c0VPUjgpDxvtRiMWgBlBhyNgwWeH1hPoK9NP6HheV3YNDCdTmlh6RvdsJ9VNxmR5uZAGYIhV7Le
	LWwcLny+9unUv9fqt3JQH0rmmC5Ty5bOC4o7MzVyfg6OMbLG81tkAiRr2Bsg/Sgh7iwQrtlzsZs
	JZTcIQX+PAMnoBGZb6YID6aepng+aReRkNUjeWIyHolYNOZmEyECU2Yitm8j7j0oOMScNYFShvZ
	OdATyiW2veP+d7zlx4ItfVzIfd5545/haeRA9p9AcGCOowjuZpsPZJp0e0g+vn
X-Received: by 2002:a05:622a:5587:b0:535:33a0:520c with SMTP id d75a77b69052e-5359f48bd08mr160157871cf.3.1791810794184;
        Mon, 12 Oct 2026 06:13:14 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b76b030sm78916951cf.17.2026.10.12.06.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:13:13 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] edk2: update to edk2-stable202608
Date: Mon, 12 Oct 2026 09:12:21 -0400
Message-Id: <179181074171.1415767.15984603469106982945.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261009141334.30653-1-jon.mason@arm.com>
References: <20261009141334.30653-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Oct 2026 13:13:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7186


On Fri, 09 Oct 2026 10:13:34 -0400, Jon Mason wrote:
> Update edk2 and edk2-platforms from edk2-stable202605 to edk2-stable202608 tags.
> 
> Add a backport for the SmbiosType2Generator clang build failure
> introduced by the newer edk2 release.
> 
> Remove the same patch from RDN2 and RDV2, where it is not
> applicable because those platforms use an older SHA-based edk2
> release.
> 
> [...]

Applied, thanks!

[1/1] edk2: update to edk2-stable202608
      commit: 52a0a3656d188f97917752ea1742b66abe7ea7ae

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

