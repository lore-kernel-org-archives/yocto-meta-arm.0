Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EDBC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:01:51 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.6619.1645797710842193827
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Feb 2022 06:01:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=5pXrCmGt;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id q10so2455191qtw.4
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Feb 2022 06:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uX97h7Chjl6ZHLe3JTWFNmQJ09xtb13Jmg5uVx5JC58=;
        b=5pXrCmGtr7o/4Bw97VNskGNLJxhy0+hp9IO3HzjWFelLRD4OYpcleRFb6JhbqKhwSS
         8mEI8YrMT9Kv5k1O4v8DVN3+/BSDdTblSSfJaUGcdgBItJr5Nl3yt5a4KeHXuavwvqaf
         dkcKR3HTCvkOckM+DtKWfPNcbJPJTrz6uUI+ebK1rUqQUviqshoN9zM7xuGEeDjG940D
         RcvzCGJV03WO6dDlm8sWmfkWPW2i3V+tIYU8+gKsDdmB9Ep6jrE6Aii7WBVItNBvRJSa
         +2Q6HIo8ESMl3UWlQgMkM9ZigRr2RvDAjEEkLIHOc7EcxuRNiGUgHMN59MegpwHdYQSB
         G/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uX97h7Chjl6ZHLe3JTWFNmQJ09xtb13Jmg5uVx5JC58=;
        b=0T7ns+6TL9EcBK5qpfPCPhYOUtHl7DC8CtKRBZiMwplwf1vy8uDq6EZlcH0/gKWNoW
         pQe7pg8M999v1b0ejEGT/8D4KMbDZfT50bNWfaXrkWWITq2VR2S3/c3FXp9MQde8K3n3
         BN+Gucti5rH3ZodTTb18f2QhLM06EI/f7MAkuOp0+6iNF6WJrpgsDNrBloGfJEl3dtNC
         6lPkAibXIaxlC+XCEc19bulHihmu8ex1+iqb5+ROG6Ajg5hgTnvKoUZIfB7bPVhWYr49
         Zoxr1Xrphni41IBnVrQXgXIRy5XMzFaJ/7Wxxc9Vimu98bwtLIKtDahuTM/GHpqtYbun
         feww==
X-Gm-Message-State: AOAM530R9gbUGSnFGGNX18Pbeu2j+am+vZZnQCbZD8UvjBDjUp2aDdQo
	vH1CWfsN8b6Yg11jMJ/lLKfkWbDCrSgI2w==
X-Google-Smtp-Source: 
 ABdhPJwbpZrLBcTUE9cYN+2kN/LwEnkZ++GuXIwIOjhrV9/rvRzJOkDOhYMZcinA6HaajRGP9OWlWw==
X-Received: by 2002:a05:622a:14c8:b0:2de:175c:fa1b with SMTP id
 u8-20020a05622a14c800b002de175cfa1bmr6851620qtx.543.1645797709658;
        Fri, 25 Feb 2022 06:01:49 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:ec60:a2ee:9645:ec8c])
        by smtp.gmail.com with ESMTPSA id
 t18-20020ac85892000000b002de3a8bf768sm1533030qta.52.2022.02.25.06.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:01:49 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	diego.sueiro@arm.com
Subject: Re: [PATCH] arm-bsp/docs: Minor fvp-baser-aemv8r64 updates
Date: Fri, 25 Feb 2022 09:01:37 -0500
Message-Id: <164579769793.11432.11180827180365508015.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220224110833.1520595-1-peter.hoyes@arm.com>
References: <20220224110833.1520595-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Feb 2022 14:01:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3068

On Thu, 24 Feb 2022 11:08:33 +0000, Peter Hoyes wrote:
>  * Add clarification on how to mount p9 device
>  * Remove instruction to use ctrl + c to stop FVP
>  * Add cache_state_modelled to Known Issues

Applied, thanks!

[1/1] arm-bsp/docs: Minor fvp-baser-aemv8r64 updates
      commit: 94682c6d1d1a8e719f2aef52e9c835315bbfa73d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

