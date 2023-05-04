Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE9AC7EE2A
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 21:11:10 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.6609.1683234665848120753
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 May 2023 14:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=1jnEt7zX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7515631b965so758967785a.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 04 May 2023 14:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1683234664; x=1685826664;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e4sFZtjlDGQI4QccRETvloO0RPaCUIgcqT4RxYNTRrY=;
        b=1jnEt7zXEjkN6qnoMs3kC7DFleEkgcp7kfARBhsqpsKebmNpeyhsD46h7DYmqhte2B
         0lljNwos6ZbHN6W5Yw7rCfDUSf47H37+29lSC3O20XJ9qrJggaansUII7sb7cRI81mEh
         6VpXZg8X2pE9HJum3NADjNe2on7GXegLsQdvZ7YosPHDZ5NiDupv5eKmd7xsoZX7X15E
         om8ada03tUwcfhSIpt2uIU/I5k0/uknbPWdKKWMxcyStJRecFRS3o/kwvkRav43EUysB
         C7GOxtpP70GrDabIECSppFXbWHmigDRZmD9ifc4cOBANuLS5pJJL4quz5bIMSJnE5tWl
         W8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683234664; x=1685826664;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e4sFZtjlDGQI4QccRETvloO0RPaCUIgcqT4RxYNTRrY=;
        b=ea+BEkdfz+qixknJfYDuaQ+RtmRz08C1MBkXgmgkPyRWL2KEUMDA8SCzJiOBI3SDoS
         FcBrr5diBY+DjlKhIt/D5bWwXma0o1vwlGGm1+ob1jYA4teZBUwOR+eNqu/muqO3CKlB
         1Jq62yj0Ph/N3FQKp6ad3ruWf9ioGb9vCedwNJfOptASZV/9JyGv2Kjl8z2rl1qHj3FF
         DLtPf131RDk4XW4Mcvc3IZst7wfC2psyRUN9szRwzXozVBlzZ68ZGqMhrg8SJqqkwZsC
         gVyz8Spc1FiV9I5EB2ae/mfiOIA8tDLCBsCyByHAyRWdQ+FEuCL0ztrGr+ocI4PYYmEm
         M5ug==
X-Gm-Message-State: AC+VfDwa5smNRn3gPedG6hk087f08zWLfEbRHsISMEI66nNZaQlhRIHo
	cSHgE2v6gQW69julnpn3EPXwk7AWB+EvfbV90mU=
X-Google-Smtp-Source: ACHHUZ621cvxBcZHm8Du9gpwOHuAwemJBYkQiNqwxp60yRUYARxTdJOLt2bLjQVC44y4W/hfXkcXfA==
X-Received: by 2002:a05:6214:528b:b0:61b:58ec:24c8 with SMTP id kj11-20020a056214528b00b0061b58ec24c8mr11620025qvb.10.1683234664315;
        Thu, 04 May 2023 14:11:04 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id cx4-20020a05620a51c400b0074e0dd4de87sm72424qkb.111.2023.05.04.14.11.03
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 14:11:03 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Thu, 4 May 2023 17:11:03 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm dunfell update
Message-ID: <ZFQfZ/T/9MwoigvC@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 May 2023 21:11:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4633

meta-arm has released an updated dunfell support tag, 3.1.6.  The tag 
contains 6 patches from between 14 Dec 2022 and 09 Feb 2023.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 3.1.6) with a yocto-x.y.z tag (i.e., yocto-3.1.6).

Thanks,
Jon

