Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web11.23257.1591976722973712799
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jun 2020 08:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pyJQ3x3w;
 spf=pass (domain: gmail.com, ip: 209.85.166.65, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f65.google.com with SMTP id s18so10743583ioe.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jun 2020 08:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=64bubORzx6CLtOEzq3akWoUhwXfy0kiqW+2TNPtKAZc=;
        b=pyJQ3x3wjK6MkenjrxeOf9cC3rlm4ZCvGjcX5l2NKEFHIEOCpmgDyKm86GjW9X5VSI
         rdrQcU2/OnWPDZro4eEDAizFDXDhaLWvRk1lImNG/x3/QsfAR4Rz6r/98G8Ng3Jmtyqy
         FPiAefqN+1UAXxRdJYoiLpn4PIkmTaW+k9eOijFFHQW888padW/2snbALTj5KvX1iysi
         SUm/bPgSkO/P7xd89PD46ow2Ojyqe1O+/p2hzeErP2Rk6sWSrw3XJWOYiA8W+iiAUBov
         Oir+St9bWHNj4PF6vobDXt4VZELaM5M5EUbosg0gN9jOzTkCbcfCGKM1hGTLOIDOpqnd
         aBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=64bubORzx6CLtOEzq3akWoUhwXfy0kiqW+2TNPtKAZc=;
        b=rW9eJyhj553dweRfJCkihnwAuNjRwFz1tDRlMoaFkGeF9LznkL+Gpor7it0K0N8oDV
         6lEdWGnh6H9j/Rj14E3GbTX/ZsYwLD6K7FhFrj0aUjcI3ZJ9LywcL/tcdyQLfvToDaX2
         30dTclUlstN0RUA8CdHhiHpm3Y6fArEgmqr2TJgzKth9MDI23dbr4FynKc9nkLZaB2kk
         u1RomXL19kJqRPohnf6LejD4bUL6bte/2Sb7m5/2IFj1i5n5qTiWXuGi2vngrnUnzkn1
         mjFrfXEwmJ+mwXA5BIASoCYI9t1+DmzpIgwT6S93waYxyclb+MYMTXC/enAJiuj3Uizr
         nnqw==
X-Gm-Message-State: AOAM532bQjwZlDfoWwWayv4TBAQ9MiWQEoHzthQMdES1g/XWgl/0oVCx
	PGJsm313H90BpHh/sYNt4tM=
X-Google-Smtp-Source: ABdhPJwa8A/2xudR3pxvELJRxgTe0uLg/zmRYNmAt4jCkUa7tON9HKHQd1GCG31/I7INUsGRp3rvJw==
X-Received: by 2002:a6b:e711:: with SMTP id b17mr14083323ioh.158.1591976722303;
        Fri, 12 Jun 2020 08:45:22 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:35f5:8651:479a:b9eb? ([2605:a601:ac3d:c100:35f5:8651:479a:b9eb])
        by smtp.gmail.com with ESMTPSA id y5sm3462003iov.3.2020.06.12.08.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 08:45:21 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm] [PATCH] trusted-firmware-a: fiptool build using BUILD_CFLAGS and BUILD_LDFLAGS
To: Jon Mason <jdmason@kudzu.us>, Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denis@denix.org>
References: <20200612124503.GB14746@kudzu.us>
 <14107.1591966447946904888@lists.yoctoproject.org>
 <20200612130041.GC14746@kudzu.us>
Message-ID: <fb140298-1fe5-c166-d9eb-d71fa050ecea@gmail.com>
Date: Fri, 12 Jun 2020 10:45:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200612130041.GC14746@kudzu.us>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/12/20 8:00 AM, Jon Mason wrote:
> On Fri, Jun 12, 2020 at 05:54:07AM -0700, Diego Sueiro wrote:
>> On Fri, Jun 12, 2020 at 01:45 PM, Jon Mason wrote:
>>
>>> On Thu, Jun 11, 2020 at 03:17:04PM +0100, Diego Sueiro wrote:
>>>> Since the TF-A fiptool is native tool we should be using the
>>>> BUILD_CFLAGS and BUILD_LDFLAGS flags to proper build and execute it.
>>>>
>>>> Change-Id: I9634604dbc42ba7da85d9b9449f1ed94ecb38df2
>>>> Issue-Id: SCM-888
>>>> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
>>> Pulled into master.
>> Thanks.
>>
>> Could you please backport it to dunfell?
> Yes, this seems like a good bug fix.  I just want to make sure that
> Denys and Joshua are aware, since it might break them.

Thanks for the heads up. I tested this on master with rock-pi-4 and 
qemuarm-secureboot, and everything looks OK.

>
> Thanks,
> Jon
>
>
>> 
