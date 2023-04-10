Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4186DC76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 13:58:40 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.45685.1681135114435829062
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Apr 2023 06:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=Zx2zmuyn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id dw2so17097602qvb.11
        for <meta-arm@lists.yoctoproject.org>; Mon, 10 Apr 2023 06:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1681135113; x=1683727113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQGax8u5F4zquUpxUm/SYc8ZEOdYis4eew7Y5MAqCaM=;
        b=Zx2zmuynPG/FjXvcXebsrX9DJ419/KM4De5cYpU+14Ms7wFxL+G/sfhhw1LR9GCkax
         mKXX7hvbXWtrhM3U7hP7dNn4otHSdJYFQGWCNG7lzs2wx5BFi9FVKuBRAe13FbQIiN9R
         /FQemoEkq5iiljHdkIaKCRd7Qqq2fy6YnSxgI2HFnP0npxNxbTDxoZLrvqcFkAut899v
         AX6bFTa0nDq8oIfMK3xnlAzdQkEYcHfQjyBkW0Vzpe7pUmGbRCU0x/fMZq10XpwImTsa
         bq18AYF2YQt0IA0AWS9zOXEFD+HKeGFYiXyxE2dlKbFwTuKLMm/JHKavooorLJVakbJr
         zXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681135113; x=1683727113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQGax8u5F4zquUpxUm/SYc8ZEOdYis4eew7Y5MAqCaM=;
        b=zOpRqNehi6mZlxM+ZmYDHOUXxUeK3+FafCeemVB/Rp3VpC9s2O5YzlhPzvooMD8z0G
         w0X6Ax+Ae7SkMtvRUhCtWLSVHWXuO4anGjud1r5YiUgBt5t392k+rSe2msikzhMA22Ms
         FzvNbkdI+MgwmuAtBJb4mB8oQBQp6hL+5Ag4BbI8vlyAtM2RCQy+X9rXu7H6TUlOITpz
         TRv+lfcXx+gwICUOoUJKxz/QQnv+V/N6dWb9NpoxqUshKKN6x3XkdxL5sukSBgaAeJBk
         wFxLbuqfgHXhm38incUW+Drvsf9nz6fxYarrHE6sckmHgWK4H2Tkszb4Xb7SNgYbiTY2
         oCew==
X-Gm-Message-State: AAQBX9faIYKnx7oUxEXbsjdEmhBpKZ4xChLXlcR1TFn9otreHzBCTwaS
	43ItIwHEwo0yDUZop9khOWcXGvwEMyZZXgWEdIU=
X-Google-Smtp-Source: AKy350Z1nvQU4zzagBexvbrNBDsvLg1mUmfqW/veUV/D7m1HddePZjlHB/YqMnzCb66qoZrg2Et6yw==
X-Received: by 2002:a05:6214:d0c:b0:5e9:46d:fb52 with SMTP id 12-20020a0562140d0c00b005e9046dfb52mr15369324qvh.34.1681135113125;
        Mon, 10 Apr 2023 06:58:33 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id u8-20020a05620a084800b007468733cd1fsm3248553qku.58.2023.04.10.06.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 06:58:32 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"adam.johnston@arm.com" <adam.johnston@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/optee: Update OP-TEE TA devkit to 3.20 for N1SDP
Date: Mon, 10 Apr 2023 09:57:47 -0400
Message-Id: <168113507110.1591809.16862193954647571767.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230403154306.3422-1-adam.johnston@arm.com>
References: <20230403154306.3422-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Apr 2023 13:58:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4568

On Mon, 3 Apr 2023 16:43:05 +0100, adam.johnston@arm.com wrote:
> As optee-os for the N1SDP has been updated to 3.20 we need to do the
> same for optee-os-tavdekit. Otherwise errors will be seen if/when
> optee-os-tavdekit is built.
> 
> Adam Johnston (1):
>   arm-bsp/optee: Update OP-TEE TA devkit to 3.20 for N1SDP
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/optee: Update OP-TEE TA devkit to 3.20 for N1SDP
      commit: 50e74acd97aa777c8781476dc627ce85aa102a02

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

