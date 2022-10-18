Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED92C4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:03:26 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web08.1778.1666055001473608773
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 18:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=ow4CS9k5;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id r19so8859535qtx.6
        for <meta-arm@lists.yoctoproject.org>; Mon, 17 Oct 2022 18:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iC7wN4NGSptG2sXC9WSb795nfX1oPzVt2I61Kv108iQ=;
        b=ow4CS9k5xZUZmZn6ki783DJliyKQY5zEWRuuD3g7gBsVlVl4mtBLsUF7+FfvuKjano
         Wm+5IkcMa95kHei5aWKj5kIJCahnBI1Mi9sOQj432qGLFF4T4uacsO5+iAcnFBY9jzui
         x/SDv/+mk5+mArsuMoG2+c6WPQD5HVZrzw2GBCOuq7ibCNqSiKYoU2uRKhG7EG60qTYZ
         ic63E5XOu3GcZniYH0BluacXx2abORPn3bg7IvT7oGfb709pRNqq9/ogyIgG7cTkW6QR
         BdDpM09M7EFVSDTVapKxx1TtWEIdD/Z3/58tx1Uur39V/KL8R9v+FgiNKL+wx0W+2HV8
         j7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iC7wN4NGSptG2sXC9WSb795nfX1oPzVt2I61Kv108iQ=;
        b=Kbtv98f5E4w4/ZnQOBDfhQDeU7OEhsk4xOJC42IKfLuontgto+K40rud0fHJGBRYAW
         pVlW967SM+mhVg4S4GjKoiOlSrtPXSpRyTPdhIlu4UzlNTJSZXDhsRK8LnwvoN2F+csh
         yuBkCYE5vsxZ7Vw7Xh8Vi0++g6k6e5DPnyTQFw0/MV/6os/GS64kHk7oPpJYJQ89DwlD
         Vl374FmDidCK+zdpRDdxQtsRNelnGltKylEWQ+tnit4xE+lWQCLspzRyc/oW/1VAB1w5
         svtILHrFDYFjVfp4aV3Ymk+d+/nOJSvIduRpeUHKKnqvGe8lSNOUfMgYsd84dbAY2Ypn
         TjFA==
X-Gm-Message-State: ACrzQf0/xLriJE2QqCxuIrfIT40dLFRohekdReU57zjANaPAtl38dZ0n
	SVXW/7ytNkvY/VxpLXyF8jJsLGrumibakQ==
X-Google-Smtp-Source: AMsMyM61woNW8vWjHj+fsRzjhfKZMiyICVVItdv9yeXQFUCrTEQ0PzU180LEOE6DNqzlE1wnh8VOZA==
X-Received: by 2002:ac8:5a88:0:b0:39c:f2d0:cc6f with SMTP id c8-20020ac85a88000000b0039cf2d0cc6fmr307595qtc.19.1666054999905;
        Mon, 17 Oct 2022 18:03:19 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id 134-20020a370a8c000000b006cbcdc6efedsm1043103qkk.41.2022.10.17.18.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 18:03:19 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"vishnu.banavath@arm.com" <vishnu.banavath@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/linux: add kernel file search path for N1SDP
Date: Mon, 17 Oct 2022 21:02:59 -0400
Message-Id: <166605497973.4026862.11502939525834117291.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221017160301.37446-1-vishnu.banavath@arm.com>
References: <20221017160301.37446-1-vishnu.banavath@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Oct 2022 01:03:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3979

On Mon, 17 Oct 2022 17:03:00 +0100, vishnu.banavath@arm.com wrote:
>     This change is to add ARMFILESPATHS into serach path
>     for linux for N1SDP target.
> 
> Vishnu Banavath (1):
>   arm-bsp/linux: add kernel file search path for N1SDP
> 
>  meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks!

[1/1] arm-bsp/linux: add kernel file search path for N1SDP
      commit: c7660b3548a9a129e04f10893dbb378c0236cfe1

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

