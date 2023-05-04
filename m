Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074B2C77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 21:11:10 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.6611.1683234668966768135
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 May 2023 14:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=5pALWNDX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-3ef5b5d322dso9209281cf.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 04 May 2023 14:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1683234667; x=1685826667;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lzgH9RvAqtFYKexqVQokno/m6zHNYCdl3aOmJ6yy34U=;
        b=5pALWNDXssvn91Ut11iUI27suJ4/GN6+REAbOAxOs2N2MJiTNVb2lyAk5rhXLQXQMj
         ComF2vbAchKJZCNmOg2iPEYPxrKfD1XMDeFjH6apI5GtD6aDhnpTWYg2szSijaU69QnF
         p2slx6Uhq+/BQ+oUhe5NJAEz9umckHfyYp2p7jxxO3MWzKMN2nXTvcQ5ywcjEDYwvt0V
         NDojnH7oUq9tZ6cA/S/N0klrYsXtWq3fq9BV90tb6CzRd64iPGd/TeeuowjWSRVt7aBN
         uRY7vTDyTHZz5XIj/YwVW44HaTbvsKGKriUEJQGpuwglBPcq6A+DyTvmS1peRB5HtXrz
         6Lgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683234667; x=1685826667;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lzgH9RvAqtFYKexqVQokno/m6zHNYCdl3aOmJ6yy34U=;
        b=YwoAwGlnuTu7/o+NlImdfIE6ReGx0cATUOSgJz+20we8oATFL7MbassVHm8bDSXCPk
         nRXh0ZfxsRrjszXhBOTDaRGdgCcn7AOXSbMw6Tv0aIpRgIyYCiIwS7wmr+1dSq5ImlII
         EqEgJU2Q+nLRzwtgGPmC0MWoaxuyTOprSHJ9RXyjLGCKil1zBRwLe8CHPW1XQk9AdUhI
         +YyVziJxnVx6Wdc8fds9vxekA05c7jKw+StMfixuDK7SMc8HK5f4ATJ68+OA40xS+K40
         3ltnquXskGt97WJrNGIIdCTcEh4uNQne4L6zPMxIqGqAAj1iom5GJh0Fo9iI78/aBd55
         kHZg==
X-Gm-Message-State: AC+VfDzAYgbMbapBqbZv6dKZo0kY18F0P5bHrdsVoY9jyw7aVJByMd6I
	G2dCc1rKKJ9KBw1yjVNLIYfML4oa54TaLGTvaI8=
X-Google-Smtp-Source: ACHHUZ7kRMPQNimWtsUxwNRLFZntBP0rz/QJpHa5WdVJZZgN+w6iAvjnuTEVhPLUAYhd/uWm9ZeF1Q==
X-Received: by 2002:a05:622a:1882:b0:3ef:3510:7c40 with SMTP id v2-20020a05622a188200b003ef35107c40mr8051787qtc.65.1683234667577;
        Thu, 04 May 2023 14:11:07 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id d20-20020a05620a167400b0074e24692929sm73642qko.106.2023.05.04.14.11.07
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 14:11:07 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Thu, 4 May 2023 17:11:06 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm hardknott update
Message-ID: <ZFQfaimEw48wDSqi@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 May 2023 21:11:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4635

meta-arm has released an updated hardknott support tag, 3.3.4.  The tag 
contains 2 patches from between 18 Jan 2023 and 19 Feb 2023.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 3.3.4) with a yocto-x.y.z tag (i.e., yocto-3.3.4).

Thanks,
Jon

