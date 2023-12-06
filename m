Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 491ACC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 14:17:28 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.32671.1701872244476666535
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 06:17:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=wMzndVmI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-77d66c7af31so69349585a.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 06 Dec 2023 06:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1701872243; x=1702477043; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKNmMF/tYqRW56pF2O2ZdjAFL2oZsSmNlX6AOAwcZdk=;
        b=wMzndVmILExN6UuOjfx/vG8h7EFx2SNf8j32FmI1IZMlM/AVgnm2bfzDBHO8ENzZm3
         b3BqznAL+j5E3cX6/347rac2yviA646kgay0R/flBo378R2XQ48BQvNeMAAxhUdjy74F
         dvSVw5o+PsnvRStaI6idIlStrzyGVpIKHE3tJIcbuX5zDNa29Pu20We4dL9nvYw105r2
         Jo9B5RXN0XK0OoyZAgyR4GC5Wp1x+Cw7FYwznc1590V1uxl4LZaiWSd5hyl1pgcaCRPS
         CEiJwbEdHQvM0Zpbs+U+HTX374+IxWlcplaxef8So+PWLpvDYxjzAlPT5+WfuB4GeCVy
         eqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701872243; x=1702477043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKNmMF/tYqRW56pF2O2ZdjAFL2oZsSmNlX6AOAwcZdk=;
        b=dfD7/9uIyIvBUhW+0k5AN459LgW/oLgQ8bHQibziqw3A01huNu+o8Hi2/cR6bE8Xi1
         awSjWBGQ6vM6d4KiMK7SkCFqll56eTFQ3bmho/Im2xi9QE9hx26WObEs7qy35RkO2GN1
         mtVsjwaUoGyyeUVczHr+r+wb0KCYG/GPWq+oWdc/Q/AzAn12YWiDQfH0p1gZAWcAN5KK
         pnPJ3gkzSgZ9BekT9pv1sbyhglxHWPgVoDbhJ1VgFQyaZzJKERtJDtfLNFegURaH/zYV
         jiJogeK2hetYw/pzKQn3Sgve/owMEtwB0NO23QpZmnqyW+mhJF+Q9Em9jzCOP+4VJW84
         VtEA==
X-Gm-Message-State: AOJu0Yz0E2XUWx6RNKUzzTenXMtgh2fI5w6+og7XypXIMEl5cNjKuRJX
	wRkja0TsE0B1Qq29c042Ip3j5TCh6eOpvsWqvSQ=
X-Google-Smtp-Source: AGHT+IG5JyOEqbeupYj5eXfo/t4nFASFNV5gYeWbZWoF2XIK6p69R9X7W+hQp90FA1ykTWESwA7p5g==
X-Received: by 2002:a05:620a:3606:b0:77f:2f42:9b0a with SMTP id da6-20020a05620a360600b0077f2f429b0amr926634qkb.14.1701872242853;
        Wed, 06 Dec 2023 06:17:22 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id bj14-20020a05620a190e00b0077dd520f844sm5905052qkb.84.2023.12.06.06.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 06:17:22 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com,
	emekcan.aras@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: Re: [PATCH nanbield 0/1] arm-bsp/documentation: corstone1000: fix the steps in the user guide and instructions
Date: Wed,  6 Dec 2023 09:16:36 -0500
Message-Id: <170187219917.257200.13450335877664755174.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231205162651.200648-1-emekcan.aras@arm.com>
References: <20231205162651.200648-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Dec 2023 14:17:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5296


On Tue, 05 Dec 2023 16:26:50 +0000, emekcan.aras@arm.com wrote:
> From: Emekcan Aras <Emekcan.Aras@arm.com>
> 
> Provide updates and fixes in the user guide identified during testing.
> 
> Emekcan Aras (1):
>   arm-bsp/documentation: corstone1000: fix the steps in the user guide
>     and instructions
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/documentation: corstone1000: fix the steps in the user guide and instructions
      commit: 32dfb759cdff927f9d837b72eb72ff80aa2bb468

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

