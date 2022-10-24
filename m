Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09435ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 17:37:11 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web12.343.1666633022471458879
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 10:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=EICjtTpK;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id a24so6016719qto.10
        for <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 10:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZLh+FTcn9E4ddX8vD3G/a8FT6TWYJ9UBSfiAIlK/E4=;
        b=EICjtTpKYuPpv/YRtkCEyzhSOC4SBxWjrCzCvvKuipPZx5VouSyrxfHhlzGA6Wz+iF
         63p0T6yuFWQIL7y/a8hgPOH8Rmo3SgXlq1Tk0uHpUDU7M9r1DNU6Vg+JmzNdxlj4fbKQ
         xLxdPAzjLGcSZgpXxpQMXFy1Kmq0OkiNI4BhV04kf0m3hMxtMSm/HIRZPFqcxnhI4/7/
         jyfVMkddD8rIxo8VXev6zQSOUwf57HAc8aB7/cmi8kJ49fSi+jbbnTr+VtPKe1yjZxcK
         CQYeN3Aycg54a/+1YbVGk9U5YR5tSiYgfQ6w11qJko4vO5Z0OxvKi+HMRur6tUR1gjlN
         haXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZLh+FTcn9E4ddX8vD3G/a8FT6TWYJ9UBSfiAIlK/E4=;
        b=JVBAIk1ePRmJay/tsVgEidDRusqwAXPtDtoOYgBF+1MXa6iilRQgzSc7NgBh78e7XW
         aiJrLmuzjGiKNtPMTfQbp3a8LOJ5YgY2tj9bFPlA/rCZVYYCne45vW+HC6OfvhC+I7eh
         w7VDtEnh1C5jbLp7WrzYv8u5VZneKLYLichodPtzJdJtRQlTFxdqb5U8zfzNWt2O6Rts
         lcigIHG48erOWdPX/1O6DJ15vmOL+TwzHHMgBuAwkDi551Vy5buaa7kUezJyXj/hzlcn
         dJTkS1UfnVRInpxxhkybDUdV441YI15s8VWZaD8GPSuRcgmmF0oj7yfeGs6cwS/MudV9
         sVeQ==
X-Gm-Message-State: ACrzQf0Eh8CcmcYreAkgn1kVayMiarL+B70AzFnrU2J2uCm7p5pHiVnS
	9zMYgy0fQGsq4qN3xayByjIMvyndLKHPLQ==
X-Google-Smtp-Source: AMsMyM7c2TxbfbJh7nA/rg7IhnvpDKJK9BqTlckx/d5WGcfLuSf8DW07skOfBsj8imR5JdN24ckD6Q==
X-Received: by 2002:ac8:5b50:0:b0:39c:bf7d:7d5a with SMTP id n16-20020ac85b50000000b0039cbf7d7d5amr28128108qtw.203.1666633021134;
        Mon, 24 Oct 2022 10:37:01 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id w5-20020a05620a444500b006e2d087fd63sm342338qkp.63.2022.10.24.10.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 10:37:00 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/corstone1000: apply ts patch to psa crypto api test
Date: Mon, 24 Oct 2022 13:36:35 -0400
Message-Id: <166663299865.2899578.155440886968550438.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221024132412.30881-1-emekcan.aras@arm.com>
References: <20221024132412.30881-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 17:37:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4030

On Mon, 24 Oct 2022 14:24:11 +0100, emekcan.aras@arm.com wrote:
> Apply shared patch to trusted services that is used to compile
> psa crypto api tests to include change in packed-c request
> message in the eaed update structure to be in sync with the
> serialize/deserialize in TS side.
> 
> As at it, move the other corstone1000 specific patch file to
> meta-arm-bsp where it should be.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/corstone1000: apply ts patch to psa crypto api test
      commit: e4a580937379be1ea272f3526c493e36478a3bfc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

