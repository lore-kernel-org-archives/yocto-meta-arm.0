Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A8DDECAAD8
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 18:59:19 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web08.2211.1661799556103295310
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 11:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=P0Q6m/Vf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id a10so2969315qkl.13
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 11:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=gUPezOxwvmwtTdr1Uo+ZNWO9nGTB1ZHxgCNcS4h24gQ=;
        b=P0Q6m/VfMAdJdesw+RRMOKkWo9X4zgd+PwUCB4m8kdcfcBjgIrBFMaEMLgTPC3QZnI
         HngqTEcKQYYi23gt1FMkeRWGKYAGPJIZcHjkYhOfKi71Yk+NE8ABUn8ES21Twuw4i6ij
         4cyQLU3PH28526OWM6BD8URyLgCdMqRt/U8ouvnr3kJR0tZ7cndcP7u1Y+qJFE7hmYN7
         xxFDvE7ELEVfCt7HzQmCv49yeR5yDA1LyvPwUThcV0GAHU/zgVcLtBj3sQs33IupuhxV
         KBP3Fweblg+SSf5lBbIEf2r+08QFYcS8juahXQsmWSMBsWCO0ow7He2CNJnqTnBosvaH
         MOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=gUPezOxwvmwtTdr1Uo+ZNWO9nGTB1ZHxgCNcS4h24gQ=;
        b=bxcGLMrXpJOdNGAcJx/LtshVBWBE7aCIUbtDt89KomRjfatAXoQU1BqnJXeH4B46kb
         WLwaHu+Gvrs2b7NcZOU3OTdhk+PRv8J3k8ismZfQ7mt96otjYMfQITg0ieyWcaNfjnrF
         ekiZfyO614etLLCOek/5N/gr+Qq4NQFlW/0TL/qc68HgPNbK0y4G55ycJZRyZsksWHHy
         oOi/O1Kii6P9C5xOCzFs91RDdQFV2ORCAgyHbzKjHeZsOEZxtJ6+QztRXvSXI4kIIEjp
         N3mslxzmsr4lzjhinyiUp+wBAvflkTYXNBFYNs3J+m0kK05HVSPN5X7PBZ0ngMdfBN25
         SCZA==
X-Gm-Message-State: ACgBeo0kQdtHHCkZIUu6cGeKYxzHEIC8PvZ1/4A0MC4Q8aQgLkFRVEpj
	lmos1SsJ+g6zd28s5BEkOi42LA4RZdaM2q/G
X-Google-Smtp-Source: 
 AA6agR6cVlQAT5cJccJFEDMW9mHN30b9S7F7VMNkYXhF1AlXMTuU7wWuPXiiciw6acLIwtHH/7gNBg==
X-Received: by 2002:a05:620a:1791:b0:6bb:58d7:fcbb with SMTP id
 ay17-20020a05620a179100b006bb58d7fcbbmr9391353qkb.377.1661799554695;
        Mon, 29 Aug 2022 11:59:14 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a05620a288800b006bb7ccf6855sm6707848qkp.76.2022.08.29.11.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 11:59:14 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Cc: Anton Antonov <Anton.Antonov@arm.com>
Subject: Re: [PATCH] work around for too few arguments to function
 init_disassemble_info() error
Date: Mon, 29 Aug 2022 14:16:22 -0400
Message-Id: <166179698237.462911.10550846417581648485.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220824025819.4888-1-jon.mason@arm.com>
References: <20220824025819.4888-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Aug 2022 18:59:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3724

On Tue, 23 Aug 2022 22:58:19 -0400, Jon Mason wrote:
> binutils 2.39 changed the signature of init_disassemble_info(),
> which now causes perf and bpftool to fail to compile.
> 
> Relevant binutils commit: [1]
> 
> There is a proper fix in development upstream[2].
> This is a work-around for older kernels.
> 
> [...]

Applied, thanks!

[1/1] work around for too few arguments to function init_disassemble_info() error
      commit: e57163cf0639fa942d434505510c8d8638e2d415

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

