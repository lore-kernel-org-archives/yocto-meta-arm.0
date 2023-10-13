Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595A4C41513
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 16:04:51 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.42705.1697213090889051637
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 09:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=QOkSGoWv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-77428e40f71so147242385a.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 13 Oct 2023 09:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1697213089; x=1697817889; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OWWefBVKt+cv0wBGWzGXHSjUvx6S2+rJITZysl+NkU4=;
        b=QOkSGoWvghb8Oex1jKgb5J4is8UZN6n7UEbvMxTiNsgrWR4762IxiIh6jAjaVo4Znf
         Jt9Aqylqql0NtnM+D5YM5jCSPyuwISlc+Y9C23vVVHbxNz+AoOS3R6NdDN7phmn3GvMY
         9AQB4Akge3oSdqwQs6qnWJHFN5+1wEWdmQyovWaFuiuHilFdTyAwNU8yR2EUj6ichQxv
         WnFyt+SnrIKNKOdO6Dp54Z4J/zClTyrwAeNZ9E8kEJ3kwsWYPIyJOdc188NXcVVqvceR
         u5MZuAjUTXxVEr8wWIeqX/tgzja7mOi2ua+7v/72n7kfXddt7m0FsweN0BtRPiekuGQY
         SGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697213089; x=1697817889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OWWefBVKt+cv0wBGWzGXHSjUvx6S2+rJITZysl+NkU4=;
        b=bIqK8iA/gWJO3p6TmafSIx3xbvCYEE3zxgk+KHsJ1n+pfkL+s8SGFgQ5yxUwjOG6vN
         ekGFDKmwqhg9WyqICtaZK1GGbWLMV0Tr99EiegoqV+svwJkIXGALvw7WtnsuUwQMaVM1
         ihTpFLhpo3MsIUXAOu8cHI63R5fT14ONUOd9suMGwJ4aS+DJl22WOEFfReH/N12QbxvU
         BWmI+IxYUoK+zp3475PB1vdcA7xc0YCst3Wi62yhPcLUeJ8buKmGNUGRLwZDWo2zj3pA
         JGGLADZUuVEN1TnwE31kD5Y5syICOg2p/WcnWD9HVWaH56g5iQd5lgd7dcBBa1PoHi4x
         FtBA==
X-Gm-Message-State: AOJu0YxyqteIDg4bklXGLDdjp1IeMN7L+aP9EyJdfIfnFSRdOgvifWL1
	KcYhf368dxbjHIhbVyC49lfTBm65GaXb5pgO7ro=
X-Google-Smtp-Source: AGHT+IFZSEEhBwgu3SHGg+Mj+ob7xqdHeFbec2S3Z5OdCbqPx6bXt+4ixAnrGJ5ZZH6FTjQUapkwuQ==
X-Received: by 2002:a05:620a:cc9:b0:76d:4252:95d2 with SMTP id b9-20020a05620a0cc900b0076d425295d2mr23315413qkj.39.1697213089403;
        Fri, 13 Oct 2023 09:04:49 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id cx11-20020a05620a51cb00b0077402573fb4sm731063qkb.124.2023.10.13.09.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 09:04:48 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Javier Tia <javier.tia@linaro.org>
Subject: Re: [PATCH] trusted-firmware-a: fix build error when using ccache
Date: Fri, 13 Oct 2023 12:03:14 -0400
Message-Id: <169721299736.1302487.7377394578893639879.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231007223019.2557075-1-javier.tia@linaro.org>
References: <20231007223019.2557075-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Oct 2023 16:04:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5118


On Sat, 07 Oct 2023 16:30:19 -0600, Javier Tia wrote:
> When ccache is enabled trusted-firmware-a recipe fails with this
> error message:
> 
>     make: *** No rule to make target 'aarch64-poky-linux-gcc'. Stop.
> 
> ccache prefix CC variable with 'ccache' word before compiler. Because
> there are no quotes assigned to CC, only 'ccache' is assigned. The
> compiler becomes a make target, producing the build error.
> 
> [...]

Applied, thanks!

[1/1] trusted-firmware-a: fix build error when using ccache
      commit: f2efb2a45610216cb6c2d72bdb5d5e61b990064a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

