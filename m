Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A003FC25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 14:20:55 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.20884.1716301253169951073
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 May 2024 07:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=gMSM0J1x;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.53, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-69b24162dd6so18401586d6.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 21 May 2024 07:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1716301252; x=1716906052; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpd3o0Gva52HR9Ny76RlPxuIh8VoCwEDCfHmIw3Q+bQ=;
        b=gMSM0J1xLc9ZaOGdt59s2dMsrxBJawgfTlwxzDMgZNxziFxvO1OEanSmtGXfmch7IR
         y0TpfGb/b1LZQXmzH6IfVnA1vAvn+GgQHrAfW3gW4hR90fxstELRdQ74YLNREjbvmlLH
         +v5D+fsK3Zvo9ZpLtWzj1n2zZARIcMZgdp+sw3ktH3Kzy7PxnxAvcD1qwfm0FoVChFI7
         A1hcN03z5I246UZMtUdzMK3SpJebg4fWoJ31khaK406wFmvFXc1pH2wzkZ6UkDxkN7IM
         ObCS4wXScjNjgPGSAY5Z6sNGFj08t7MTY2DaN7DhiqFEFmOLKncZQUiUOMXD26MxNw3l
         HNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716301252; x=1716906052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpd3o0Gva52HR9Ny76RlPxuIh8VoCwEDCfHmIw3Q+bQ=;
        b=a29NGStIN+Xb1z9g+6qEOuf9SfRXcoJa3ELVziTzXsrzRx9UaHk55r/KcyywtD8JSe
         nbnyiXKHp48LBSwcUt9O2Ah94XqWKpEDsr2TbyBRGqeb1FT0WMk55SqYLfRjPfKETvDl
         5ZQsx2PD+ZEtriVeej3WDP0e71eKB3aIUgHsaZzZlHWSIY5t+18Kx0MehPXQyXWBmSOz
         tvVrk/xllYzf7LxT/1j8OwHFjGq5ZO1XChZ9KEHWZIQAFdPXnnroAIKcWpKPcF82zckW
         2Oyw4uLZzTiQZZCHmfESKDSzEh3PW3tjJ8QFOyC4fvKtyI/PDpY9JhF7VUtA5xGT8V8g
         Vnow==
X-Gm-Message-State: AOJu0Yz0jiJISCDGyZqODpzBL8Kk279tZXzCkmowv5GghtXUErP7ROuj
	fij/pfeZipUcKKkAfX9O0TsiLc2REB698naBVU1IbRRqdwbgFSjlCsuQ22WcuHWMfJpS70Achfg
	=
X-Google-Smtp-Source: AGHT+IFg9iAOMixFUrBytcFk4mQ9hc6tY0bIAV0D9v9T7UwNZOcbOmZ6+LxPjeKTDc5Dh4EHEzyc4w==
X-Received: by 2002:a05:6214:4b12:b0:6ab:2945:43ac with SMTP id 6a1803df08f44-6ab2945460dmr58942406d6.2.1716301252165;
        Tue, 21 May 2024 07:20:52 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f1cd220sm123189936d6.93.2024.05.21.07.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 07:20:51 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v2] arm/oeqa: increase optee and ftpm test timeouts
Date: Tue, 21 May 2024 10:19:51 -0400
Message-Id: <171630119068.2318166.17168706386637065646.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240517175022.48759-1-jon.mason@arm.com>
References: <20240517175022.48759-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 May 2024 14:20:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5745


On Fri, 17 May 2024 13:50:22 -0400, Jon Mason wrote:
> OPTEE and ftpm tests are failing in CI on slower systems due to timing
> out, but actually finish when given enough time to complete.  Increase
> the timeout value to be roughly 100 seconds longer than the time it is
> currently taking to finish on the slower systems.
> 
> 

Applied, thanks!

[1/1] arm/oeqa: increase optee and ftpm test timeouts
      commit: b8965bb95ba4e3f80b99ac0d67c7f7a326fbb5de

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

