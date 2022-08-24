Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B133FC32774
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 03:03:09 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web08.6878.1661310180807367532
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Aug 2022 20:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=oTHSCH5p;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id m5so11771286qkk.1
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Aug 2022 20:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=gUPezOxwvmwtTdr1Uo+ZNWO9nGTB1ZHxgCNcS4h24gQ=;
        b=oTHSCH5pNMBdQ/ZgYklBIunAUfSisNMCrNSFkYPpQnwmAFG03zzY5nN0nvMkPCdwJ2
         WaY22YGDOZKdKH4r8PAOjyp4lGTrRwIxYMIZkmZnJdGC0Waf5fXMmj3RltY9n70AfLEK
         E/HtjBXdd/FynSVE3vVqIxwwEr2ZOMumIrk5nSOS5V1XaLuNoEwgW+CYbY9vOJcjIw3D
         BzCbY3205xd8yh0mIbVLMGOGq3oh/YbGg13DF5lJvPkV1LXzsPWbpMX1RnhWn1ztJar0
         9r0KyCqWVXxWGzVtZ8gwfv6oWEp4P5RifDNc2+gwEHIFOaW+gztoU74MHuA8uD2iQnwU
         Iy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=gUPezOxwvmwtTdr1Uo+ZNWO9nGTB1ZHxgCNcS4h24gQ=;
        b=D3Tg5nymhckYajTNelRwZ3iNnFb1Jc3+krNp1KU5l0joNquP2GLh9olMTFTjbbb5lt
         pX9FUsdB14BLPe7LCbojL+IYDo5/h0hBy+t4M4RF+hRHlFMQxjr8F7kuF63DaRcEjZlZ
         dKGhfNSo39z5tEu7MRzosUory4piV2iYv4J10yURloGwdSbrvAwSFryn6MhnEaikoQso
         4Nk6xYSIS44NoCV0sCvpOyXb74mdMHm/XwOFE6XjRjGeC/MyqAVijeAXEkOVRANYkdx0
         80ixtHcc1opE9XvaBPYFwSHcEL+5xG8TiB0o2WXGwznMd3m4OaFfgVSMqZoI/k7d0UpW
         zAzQ==
X-Gm-Message-State: ACgBeo37uui9Fz+gQuOTHANebkCreTOF4J17fybSnpI3C2rwjIhh3TzD
	2+/8kpcV1mfmjMiA17sIUjtwm6y5PZZo/DRm
X-Google-Smtp-Source: 
 AA6agR6QPAJKy4C31TcO79KvG/bnHvs4PWelZQ7V4PenvnSVv2t4bN+hYEcmCj2AZPH2Dtc/tO89Pw==
X-Received: by 2002:ae9:ea13:0:b0:6bc:2056:100c with SMTP id
 f19-20020ae9ea13000000b006bc2056100cmr8023124qkg.100.1661310179436;
        Tue, 23 Aug 2022 20:02:59 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 h16-20020a05620a401000b006a793bde241sm14864426qko.63.2022.08.23.20.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 20:02:58 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Cc: Anton Antonov <Anton.Antonov@arm.com>
Subject: Re: [PATCH] work around for too few arguments to function
 init_disassemble_info() error
Date: Tue, 23 Aug 2022 23:02:50 -0400
Message-Id: <166131017064.1520857.6642980752295740142.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220824025819.4888-1-jon.mason@arm.com>
References: <20220824025819.4888-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 24 Aug 2022 03:03:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3715

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

