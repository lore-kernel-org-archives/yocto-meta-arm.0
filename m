Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCEEC433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 01:41:48 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web12.1744.1648518108009471982
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Mar 2022 18:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=KHaL6+Fg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id t19so14100859qtc.4
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Mar 2022 18:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=c8PYeXG1DESo/+AoulZkIUVCyt/QFWU+8KxZop3tkDg=;
        b=KHaL6+FgBUcrM2jADA+igTB1OUUQR71GqcXtKsqBmisPtLftZl0JS0ca1bN+ZJmC3O
         blJSpWW6hAbSYRLK9jJ97njhL4AHSQYMo0OjpXl0ypm8hEJI8HlnL0uz0lUeYHxPTSH1
         MQaMu1nqKOw/mEVfeEOcBBdcqHzqtJdea8rl3/fp7fesv/ckZev4EeXFxV6EYuTEGjwF
         UibXPCGZA5qQ1lmrXOwi101Jcrx3oz7dUNkB6m/D7Fau00VDUzq7GlyVkAAHxa8NrEoS
         uRZ9EtWBztWAH34swdueqJw+FPNiXZv/1whBn0AbXoPzKO9Nvg5Mnvvcnmup3C316Nyp
         NXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c8PYeXG1DESo/+AoulZkIUVCyt/QFWU+8KxZop3tkDg=;
        b=RCsWIRqIDCeTcw5gXmSMZFqqamcSBEjAf7aJldHXcMCp/uw2JGJ7hDbeBx+kbjfeBF
         4ie9hQeHaq/qIPx0l1+pESxN7qH1+GqVxeu+TEOqX0L+K6keYCF/WhSmCxiscxr4YTil
         noPK9weyeVOSLmH6LQGxRDsgh9x0Map/jCqOe9SbVitk+xd2pwoyJeLIlXOj0h4ZLgiV
         tN3lgmVkegVqVcwApS32u/fWJ9bgukLMHDr5yeVB+JH4hpyiZjSOQJpuvZfux2IWloqV
         94muGBkDfrxYURvlGQi9bRZjOt5dCj/w/z2r3coNEw3xrP66MNVKlmM94yuNEK6KSFSg
         Gxnw==
X-Gm-Message-State: AOAM533cD1fTT5oSgMDfEQxpVHgh7/02lmABDQA3jKyX5HUOATJ6P+s6
	Hp6BIejJgrovXYPG/0n52Ad6ecOCmWfGvPhd
X-Google-Smtp-Source: 
 ABdhPJyvEf2hfEbop8/iKECcbALuQCGYmwyvEL0AXP2W/3bnHIb1EdRxoBEhTLrij790+Ayct1JUMg==
X-Received: by 2002:a05:622a:1a27:b0:2e0:64c2:7469 with SMTP id
 f39-20020a05622a1a2700b002e064c27469mr25390228qtb.187.1648518106973;
        Mon, 28 Mar 2022 18:41:46 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a05620a166b00b0067e380258e7sm8644065qko.73.2022.03.28.18.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 18:41:46 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] CI: fix INHERIT assignment
Date: Mon, 28 Mar 2022 21:40:56 -0400
Message-Id: <164851805626.4706.5961926826392960333.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220328110337.1253833-1-ross.burton@arm.com>
References: <20220328110337.1253833-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 29 Mar 2022 01:41:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3215

On Mon, 28 Mar 2022 12:03:37 +0100, Ross Burton wrote:
> We were accidentally assigning instead of adding to INHERIT.

Applied, thanks!

[1/1] CI: fix INHERIT assignment
      commit: c49d4018285db3fd5c91fe46aaff5a5291332dcc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

