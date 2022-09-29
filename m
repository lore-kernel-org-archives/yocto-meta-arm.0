Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196E7C433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 19:01:28 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.14236.1664478086473661072
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 12:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=1uXIZhAl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id f26so1357305qto.11
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 12:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=fOX3Qm/nNG0XD/wfc6uoVN0c96TwiW3kI6DKBv2YKek=;
        b=1uXIZhAl6yE6bHxr0jJ4K1za6o+pdTE9FTiiEOSP6VKmnyS+REGAzIOquZ1+T5bPTb
         zY+Y8w3CUCaliuOzO15WEeZdemixra0SPLTvkvQ+amPW4qBKD/ZtBFt3zSDq83mAzUJH
         9XQompGAkPQk8KxImeFhxZLPOAtOp7KBwPCULfXhPyp3yTRwFnX22xn+rUP3KjwEn2i1
         R9rM55utEJU89dzThLIb10tl86P3RdIOn+XhNhz5NVgxkqhB9Qn4LIxhcqQyUtuanMMG
         uQPGygW5d2DMBhTsw2/N55wV2lt8Q7J4AGg5rBwjMXLxKdlJZjMvdA21ZonsjUEk6pBk
         e3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=fOX3Qm/nNG0XD/wfc6uoVN0c96TwiW3kI6DKBv2YKek=;
        b=R98YAXma/o7BC07BXGcXbRmjDKVFRRA+G2t3PJe9ytz9YzwYzKO4kiry31vZtnBFse
         rKqYQtd0zQOG8rVcC7enPKwCz0CzqIcp1EP6i5nlnltWgpIpfY+ENVJ+buQpat4KB5p4
         jKL7/8ezQ0cyecFAY9oRDe0Oy0ucismcDy4/9bd0/c6C6POgokX+zTWNZd1DtR5dRLAn
         OGcob3oEqg+Y39aZh3OXFY3JCDiVjiMLTIS78isdvIyNOU1sE3c2JduTp6vJv56284s7
         6WR3fe7TMV2Wp27P/+cOKteDomlp1vI/eQAq5t10w/XDAIQ9z0vs3O1LPWw0h1+nNywV
         D6vg==
X-Gm-Message-State: ACrzQf0BXjF7899sCmDblkFhEHGzai588fbAI1eeiSEqw/RtQ39L7Hod
	FtuhP0Ggz56bV4EBKceRpqk+ZW2QYS52Wg==
X-Google-Smtp-Source: 
 AMsMyM6VpioX677jD2UvZBeQ6A21wAzuubGOYA/tgVZ6wc18jvs6L6ij/VbCqz/nJdr7LAT37SXd+g==
X-Received: by 2002:a05:622a:1911:b0:35d:20c7:6226 with SMTP id
 w17-20020a05622a191100b0035d20c76226mr3673488qtc.619.1664478085197;
        Thu, 29 Sep 2022 12:01:25 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 o13-20020a05620a2a0d00b006ce51b541dfsm240397qkp.36.2022.09.29.12.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 12:01:24 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Davidson K <davidson.kumaresan@arm.com>
Subject: Re: [PATCH] arm-bsp/hafnium: enable Virtual Host Extension for TC
Date: Thu, 29 Sep 2022 14:56:29 -0400
Message-Id: <166447779548.3284601.3447812897534898501.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220928145447.48196-1-davidson.kumaresan@arm.com>
References: <20220928145447.48196-1-davidson.kumaresan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Sep 2022 19:01:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3872

On Wed, 28 Sep 2022 20:24:47 +0530, Davidson K wrote:
> 


Applied, thanks!

[1/1] arm-bsp/hafnium: enable Virtual Host Extension for TC
      commit: 3f59a344e66dd9868c578868392bc9cdc0f7efdf

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

