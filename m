Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAA4C433F5
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 19:01:38 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.110.1664478091761691063
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 12:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=eROuUG1e;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id j10so1372558qtv.4
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 12:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=yKE6TtR69AmlDo+H4fIGNJRnALm9jKz3PYVLPesfkAs=;
        b=eROuUG1e49ok6DKw8eKCB9gM6K+36TC7gqvz1w6pZcSExMAPz0ReiYp085QsOK/Lkk
         xoSMNbOnFYbbreDLiRJspjRmZ0BEPm9SanG339d44d4v++zqgeHK/M9kgy0O25nz68xs
         nFYzERC7/MARJZlNhSJZcJFueWct29YtAE6ot/qm17hX/wZMQTkDlaGKRd2H5zgpXkri
         cy9g7zdaDkhkJfVbt7wL33wvKCxlHGJN60V2zcYZVSFowkT0k28MsqeE9D5jSXvN1QmX
         cinwm5spQ9xm7TOjpsX2rhXox41uULTxYS4n94QDXLPbR5xAThGvMqG36ONQhZAkb+Up
         5kKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=yKE6TtR69AmlDo+H4fIGNJRnALm9jKz3PYVLPesfkAs=;
        b=S/ndwQaXT/FJ1CygJ3SHmTpJbZw3XlgBehmcfXCTbqCZ0ommKlb6MtyxS6BZpAiAjL
         YXehXgmCRr/GGFJ7hHprlk00c3NkOIcA2visZBDPRXVIBZuQkixneu5u5mcOVCAegi6u
         Gp3qKHYSOLUadD3EiGgvbzacmBPi5UjNg6dSuz2N3ejGdNscdRfYBRiH9MT622jvAe13
         G9TKJ92hV6b86YIBWBVQcWlspdLCcnAq5/U1eX7tlrCCuMYwHz6v28P4scltk2mkF8Xg
         ZTfyaIVdesnvfw65n7wgJTeYMUrP7Rscv+8qkVx1tNqwoyABTUdUdDBXzknc+lyph7oS
         zpiw==
X-Gm-Message-State: ACrzQf19bWB9DOqs0kPyV1WaNdyRWBNgeKOQDotcc12MHUcw28Zeo3QO
	09iKA6lzHNiwjuFxL60UUH9JpPiEoGNOnRv9
X-Google-Smtp-Source: 
 AMsMyM5gyCoyZjsaj4Gte8q5Y9BLHPF6WmCGLvTrwqfgq3OR6YrzMTGggOu2uu/j2BxnM/PcOVMucQ==
X-Received: by 2002:a05:622a:58e:b0:35d:553b:d41e with SMTP id
 c14-20020a05622a058e00b0035d553bd41emr3786433qtb.664.1664478093746;
        Thu, 29 Sep 2022 12:01:33 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 q34-20020a05620a2a6200b006b8d1914504sm208683qkp.22.2022.09.29.12.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 12:01:33 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] Add MHU and RPMSG driver for cs1k
Date: Thu, 29 Sep 2022 14:56:31 -0400
Message-Id: <166447779548.3284601.1458974991380992206.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220922145956.56063-1-emekcan.aras@arm.com>
References: <20220922145956.56063-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Sep 2022 19:01:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3874

On Thu, 22 Sep 2022 15:59:54 +0100, emekcan.aras@arm.com wrote:
> The host uses MHUs to send/receive data from the external
> system in corstone1000. These commits add MHU mailbox device
> tree bindings and rpmsg mailbox driver. The host can now use
> the driver under /dev/rpmsg0_ctrl0 to communicate with external
> system.
> 
> Emekcan (2):
>   arm-bsp/u-boot: Add external system MHUs to u-boot device tree
>   arm-bsp/kernel: Add rpmsg_arm_mailbox to corstone1000
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/u-boot: Add external system MHUs to u-boot device tree
      commit: b573b29b766f231b6d3a21b21426738b2ce9d69a
[2/2] arm-bsp/kernel: Add rpmsg_arm_mailbox to corstone1000
      commit: be8890bb034cb7d850e975041baba04cca2fb93e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

