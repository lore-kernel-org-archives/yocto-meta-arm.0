Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E37C6FA82
	for <webhook@archiver.kernel.org>; Sat, 10 Sep 2022 23:13:28 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web09.5000.1662851604926186767
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 10 Sep 2022 16:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tq2VDaYY;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id
 v2-20020a056830090200b006397457afecso3440157ott.13
        for <meta-arm@lists.yoctoproject.org>;
 Sat, 10 Sep 2022 16:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=ggGRvdoZDvrQL3xTjaFG8y2F4Ov6EnVA1XCdRsP2JPI=;
        b=Tq2VDaYY6lUMeaxghtMYtnIFNCmCCiufrPno20aSeTfhvFuK48Ak85rW0jMiw8217N
         rKaIg782eV0t1aj46xACFWZTwMPnPu2+NAquJkikzqMTit2YygulWH0kLnpbrc13FMDA
         D5rYVevFkiQ6iP4GBHFORpHu7ywi1HVbYgTaZEHJGcasfs7zVvJKhDG27KyttfjNfOfz
         WVB61jEeEF91P0IJCBGExzL/PmNcpvx87yXwFbFOvCPt+qClgQAZ7Sbd+an55iWwCSiX
         Mdv4TcZuREJLbava1u9jOrJ9UWfvvKCIviMZAejDkQfHIpnS3dxmwXpUJi/8xPJaoF1C
         rK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=ggGRvdoZDvrQL3xTjaFG8y2F4Ov6EnVA1XCdRsP2JPI=;
        b=ekbYVRz6cLMKfPGsCzt33bX8AhhegK+KvdbBxPfhsLP3BpZtCodj3AUu7WgDQ/o/jQ
         Ba/ATeDOOCP63QhIifHiDXBcTt/2SeqGK9IlmUuStvR30alptmZAaeP5W6Xcgde6qBNw
         M7dJYuySx0TTH3bIwK0IvUvBTNjpvFYilBpiWTKMA8OlJ37bsn3hgP7A7spuAtq5BV8n
         Uqah2HTbcR3eUBKUfKCxtQqGslT8bXpTszApduUNAgNiRGtuMf8rC6nIb98AKqsB8Jng
         N5Ry3SiU6Wv8l9P3btBtiqjIUtxjppnvLegN7+OuUuDkPXVkFG6zS8Axw1WqBreLbPD3
         R0HA==
X-Gm-Message-State: ACgBeo1f+pG59xgzHCtHtab+A2y4O+a6EILhcjiwSMbHLDKKE/TaP6gs
	wphfsAXlKcXuotGA13WCFweOUFIGPYhBYzRXSog=
X-Google-Smtp-Source: 
 AA6agR6RLIn/7Ckp3Tdv1LCDsEKqPnFYjjvLYDCix02NUDB0oUpoto9BPqVeICT5MXMq/YdwVPghRupqN/4kRpuPiwA=
X-Received: by 2002:a05:6830:577:b0:637:1cb5:857 with SMTP id
 f23-20020a056830057700b006371cb50857mr7739086otc.55.1662851604085; Sat, 10
 Sep 2022 16:13:24 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 Sep 2022 16:12:58 -0700
Message-ID: 
 <CAMKF1srnFCmdz9sZa5LNKP0FS8=VGT7Zjp-PL_XWK8kkNQb_9A@mail.gmail.com>
Subject: New failures on master with clang
To: Jon Mason <jdmason@kudzu.us>, Ross Burton <ross.burton@arm.com>,
	meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 10 Sep 2022 23:13:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3761

Hi

I have done a world build for qemuarm64 and here are few failures uses
linux-yocto kernel 5.19

arm-ffa-tee - https://errors.yoctoproject.org/Errors/Details/671648/

this is a kernel module so its not built with clang, seems it needs
some adjustments for 5.19 kernel

ts-newlib - https://errors.yoctoproject.org/Errors/Details/671651/

This needs some love to work with clang+llvm runtime options. I think
the limitation is that LIBGCC_LOCATE_CFLAGS can only take 1 argument
when used in cmake. here we need to pass --sysroot and --rtlib options
to clang to properly detect libgcc

ffa-debug-mod - https://errors.yoctoproject.org/Errors/Details/671652/

It seems this module is already built along with 5.19 kernel, so maybe
it should be disabled now.

Hope this helps
-Khem

