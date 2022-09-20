Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84120C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 22:36:37 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.3538.1663713393524676459
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 15:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=tHvGO9xF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id q11so2797568qkc.12
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 15:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=tl48HNln30mS3WmYVrwYq4M0EDLxwwKQU+mpqQ9wd7E=;
        b=tHvGO9xFctfzeBsEvf6al+z5Yby0Wi1sJWiERUtZxnisi7/5E7AIbe5WjPLLOUVPQP
         GTbuf0X5uNqrqJN9WFdXVmiS9epXy0sk+nyjG8H/muh76JQtOfwNvq5FjJ56Qrw8GuHR
         a+T+Bz2WtzgMVz+t5NNxxPJ/ss+erj00zOMNkDOMBcauzdrCQrIQpsAWfyaKYdgc+CgG
         7A2n5SptzmFPh/odWKZ7CReQ0a0oGDBknQmh3pjEdfYp5F6hltgTSDxyms6vmb0CX4vc
         7YSR6SIKRridpA+jR+sC6V8Zq6YpbadlkcJfQ1Ba0HxcfJsP3fbF9X1o3P1m4J97hI+5
         6xXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tl48HNln30mS3WmYVrwYq4M0EDLxwwKQU+mpqQ9wd7E=;
        b=XDB3+aUd6jN6W3HR2kFfAZtZRTPqPT4g3OVunaw+617CkJWroxfu9FPa/q4mFAwBFp
         S42UFacyR3DXDy/4RK9Q7hJ9ToXTS6lI7VkJGv62S71OEkR6nBVftQqvTNyQH7OvXZeX
         jEm30sN5rk55a4YQoJfV9I1brXd2IV8EoVxZjW38xWGUgs3idPzWTRtfqCsnaf88sUGO
         abfo3E9zxiPCFjwMsQrcCUr6nT5MAL6/KStDo2Aqe25PIxM3gMFLxt/Wg/f2tnrkswW2
         g7RE6+meEHqTriawbr7PyxoqLQSeMSRko6WNKRgiOpgUxzTPEGNAsV77llpLhl5meehb
         qMGw==
X-Gm-Message-State: ACrzQf3vSV9SQEisYfERTdCXTfxiRder5m8WjqGg6QwJyiy1b2wDdSMf
	tdTtNTn+Gt7KtSKl9x0tM8p5siSkRBmifw==
X-Google-Smtp-Source: 
 AMsMyM6CAlYMZ6pqX1iZDug2QKa/f0jFr1O3a9ahQ+vLdwkaS93MZ+sL7T0l1qU7rDCeHwMoe7V50g==
X-Received: by 2002:a05:620a:c50:b0:6be:9b62:6e9d with SMTP id
 u16-20020a05620a0c5000b006be9b626e9dmr18150232qki.67.1663713392299;
        Tue, 20 Sep 2022 15:36:32 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 bn41-20020a05620a2ae900b006bb9e4b96e6sm656426qkb.24.2022.09.20.15.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 15:36:31 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH][dunfell] arm/trusted-firmware-a: update mbedtls branch
 name
Date: Tue, 20 Sep 2022 18:36:26 -0400
Message-Id: <166371338662.2603994.15954522690463257811.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220920135829.1364872-1-ross.burton@arm.com>
References: <20220920135829.1364872-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 Sep 2022 22:36:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3792

On Tue, 20 Sep 2022 14:58:29 +0100, Ross Burton wrote:
> The mbedtls repository renamed the 2.18 branch from mbedtls-2.18 to
> archive/mbedtls-2.18.

Applied, thanks!

[1/1] arm/trusted-firmware-a: update mbedtls branch name
      commit: 2d863769316995f4cd948e3284c2e94aa75c949f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

