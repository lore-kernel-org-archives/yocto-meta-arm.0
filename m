Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082F3C7EE29
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 21:11:10 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.6610.1683234667200594891
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 May 2023 14:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=tZGGcxug;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-61b5de68cd5so4723956d6.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 04 May 2023 14:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1683234666; x=1685826666;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8k6ei1J6ql/SpJ0+zgey4M6lw1mxgL+naNXEYAW2klE=;
        b=tZGGcxugOBCTc13uypyWcUJgJPJ5cfvRWgklnqBq6lsnlKl7Jbdm8lq1S2d4k6JeY8
         axIGh6ImP/I6E7lxeXdNjP3Skn6j80ebFWHX3wtTJqZQk/yAumhjSOm3W5mpHL5wsl0g
         FXkp+x2qZKzEjpY62EMjexZH3c4ymTfYM8Y9gFDrUuZ5ANiJuQuLHNld3tV3ioQzxL9Z
         MfuKAyBH+M1oU8u16cwQExTHXgb8GDEzER7Ch2NQyUfsCQGguN9WcFyOmPwzOlmu90jR
         QJ35t5ZG/wXI069apPETqYiiESLXTFk6mjW0Fmu+kW15SwHSqauHMAYFWm4hqzLVb2AC
         n1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683234666; x=1685826666;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8k6ei1J6ql/SpJ0+zgey4M6lw1mxgL+naNXEYAW2klE=;
        b=SIzxZNtTTbtN6+XDabG4HpsqFLUHzGC8DcTv0RelMEJK0wgfoDqGJvNc0WG3kNYExx
         H/NnPoSG8mZvPus4Ny8UCh/kRzfiPQHvvm1RqIezuUpQzgVXEg5yprtaFfAD4VYS0jrN
         IP7syV7yRTh127Ykeh/9fiv+giYGXmPYpNt2Mcnej54EFeS4WAtqZcpyfcoPtkZHg/1x
         C7hRZxBHbfwAJ2t1lfbR5WNCy4Es+m+pWaZ5X39C+cCC/QKJ6zArT93FAo8bXX6Y1xYq
         VObX70jmICofCwK7vGWgCpV4DR9aRJsjo0s/+Nky1pCxUMCLml5765FE5xlznsBZ7gwV
         Tt3A==
X-Gm-Message-State: AC+VfDxXLkMuJ5UgdiKK8GLPpKbR+CVkiNhJlsGBXaOsLG4uAO6PbaDy
	oedxDVrzP86rtfsMMjoDOwQPCatKwVDkawDmtn4=
X-Google-Smtp-Source: ACHHUZ5UpQ3MOhXeyiPMB26hIITIBarffTTmQnZWbHRvDJAV66Oigsgmwku4Jczgi3cCa9QYX9N0Zw==
X-Received: by 2002:a05:6214:625:b0:5c5:6e60:eacd with SMTP id a5-20020a056214062500b005c56e60eacdmr17323331qvx.28.1683234665979;
        Thu, 04 May 2023 14:11:05 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id t17-20020a0ce2d1000000b005ef442226bbsm47493qvl.8.2023.05.04.14.11.05
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 14:11:05 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Thu, 4 May 2023 17:11:04 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm gatesgarth update
Message-ID: <ZFQfaAv79Db+p3yO@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 May 2023 21:11:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4634

meta-arm has released an updated gatesgarth support tag, 3.2.5.  The tag 
contains 1 patches from between 18 Jan 2023 and 18 Jan 2023.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 3.2.5) with a yocto-x.y.z tag (i.e., yocto-3.2.5).

Thanks,
Jon

