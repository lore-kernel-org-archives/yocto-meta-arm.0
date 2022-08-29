Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED81CC0502C
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 12:57:45 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.70212.1661777863933150162
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 05:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=PobtMdFf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id s22so3411940qkj.3
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 05:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=gUPezOxwvmwtTdr1Uo+ZNWO9nGTB1ZHxgCNcS4h24gQ=;
        b=PobtMdFf8PnSYVTJJkeOCQb3B9F5JG5oxm53olWjmFb1CSqtDXaO1UfsBk3Fy/T9MU
         LhmsRhTmg519rPK44Oy1hTy02S177p8Zo5PRoUFp35ugruAttvywUVkOHWhiF7AT6Uza
         X+GPBmgN+JSVcFcDrGZ1pOqPMe/ELKj8RFlYv/PJMex+Ei9Jf/hUnTwsvqbQxEQH9FEl
         Fouy5rIqYU734y0/7bQjG3WI3/UvB5++PK01iTWJIbPMmByUCpkeguPs4OMp9mwRnnzx
         olpqEt3zbwArDwCrX3obsBmsQrslH24pTBU0yFqzjje3ljPNpS8ez+wK7VbFN0MF426w
         /isw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=gUPezOxwvmwtTdr1Uo+ZNWO9nGTB1ZHxgCNcS4h24gQ=;
        b=lGanMfxl2kaejoNY3YmAbWQ2PfcJW/jPEvQmv3bazujtH+N8m0rME6cbbD4Ubxlwwd
         swHWNnfCa+du6tL1NR2dei2DUeBfbQRXMOsp9fWxhz9ipa7rv6vZ3M+i2Qm5WfehFlfx
         o61rjjNYNTxx4P1oX0T07iymlxz4yO2tJX7+gByGE2jktWwOS8krxNRsz2Js62tHLp7e
         XnzRATup0vPprIHqs/w08EW0fusKfDMqPQe6/Dyu2U5MhfWOarYysgnSGaM4DqkeF8Uw
         XjLVFp+gCQibDzECFg6KvIK+D4bAxNqUCxRfaPmG+Oj0CVwc3qlzyDQNyQ1V68Frj6nZ
         N1RQ==
X-Gm-Message-State: ACgBeo3UdqMD79UDS6gK8uVJJhXpnN9uWeKIe71cnWS2idF8jmKrmBsX
	TFsI6h/P/tfy0faN7faX+HjuXn69l2e++oBN
X-Google-Smtp-Source: 
 AA6agR4cy43lRsgB7MJLePf4cBbrn03otsVyz7idpk8EdqAP12y+UlJZmFSbtD2PrlEyIApO5C9S8A==
X-Received: by 2002:a05:620a:4256:b0:6b6:63a3:7289 with SMTP id
 w22-20020a05620a425600b006b663a37289mr8468148qko.39.1661777862470;
        Mon, 29 Aug 2022 05:57:42 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 b10-20020ac812ca000000b003434d1a7a14sm5058120qtj.62.2022.08.29.05.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 05:57:41 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Cc: Anton Antonov <Anton.Antonov@arm.com>
Subject: Re: [PATCH] work around for too few arguments to function
 init_disassemble_info() error
Date: Mon, 29 Aug 2022 08:56:18 -0400
Message-Id: <166177777779.3919442.16229736509295958728.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220824025819.4888-1-jon.mason@arm.com>
References: <20220824025819.4888-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Aug 2022 12:57:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3719

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

