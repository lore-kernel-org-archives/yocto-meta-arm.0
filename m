Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web08.2510.1617751122212995117
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 16:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XV5mNUjp;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id g24so12475807qts.6
        for <meta-arm@lists.yoctoproject.org>; Tue, 06 Apr 2021 16:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6mMtQBr7YGiDutLRWA2zcbPvJGMjBsodLQSwgBJ52BM=;
        b=XV5mNUjpxqrrhJcx7v7VsPZr7ypTK/W1W7ewwsc/sgZYJMq6DhF7wbI9Vkod0DA5OF
         7tqbP/0byCkByzK2spZqG4klYK1ZQGutAY+ld95ZVipXt/9eGxr75QhFQ9vB0GACJr5n
         ukqEEHZVa8pq7zRSNOCBilWzEOLkbh/EjAbDFPcgY2jz50sL5uLBQ5ZbsOETFlD4mdRw
         ZLo8EOejRaag04H16EQpS3elj3xyDHvK2m4cXO4K6v4zFNvfGRDOQo0cZMrAPBSS3yPS
         pBgYsvrROyP3VeBDXVrju3FvU1OOVQHP1t4blcKqQeMwJKyvPilrVz/KskN8BwYhkABj
         RaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6mMtQBr7YGiDutLRWA2zcbPvJGMjBsodLQSwgBJ52BM=;
        b=cPbq4r6M1t+nCb5bOiF3Mtbkqu0mcea6StBY/39GrZEuc7yhas8eJz5JtLib4dNrO6
         x4J+fYnIUzwAjG7eTJIp2gO53t+z/DkmkD3+8PzaXe/EYqhPzjbqGBnGGjdKYJSF/iio
         tZYe4Pm/a+YtvtL4yzSwtVtEVw/daMubcuo4O5W8fx0aV5XsG6ZCovx38BkKekgvOFJv
         uUTK89PD0pQFEPYmhHjUwq+u6HUvVVqQHGKx4dlLGyLy21FN7ld80neZJZQ/e32wBeT6
         BZWoEpsW4xxU/5sQSimEfkzSJTiMm6mr/Y9CclsCkw7kDmyViFQx9EHKuv803bFrB74N
         IajQ==
X-Gm-Message-State: AOAM531Jog1lNUUEcLUr4Oo2bjcGORlDvwQTIW2KLW3hc9puWzYFn9iJ
	nBSJkrQ064GPoUmLm2eQo7alsc+saz9Cnkvp1bqjQeH38cK7PA==
X-Google-Smtp-Source: ABdhPJxWdUzO/ZDnIDkS2cD3dqWyezMN/reMWrLDmqq1VvSeWq+4YaAihMOnaTTa1FhFd+MRn8r1qWC2uPj+F3+w4Zg=
X-Received: by 2002:ac8:5cc4:: with SMTP id s4mr341483qta.214.1617751121209;
 Tue, 06 Apr 2021 16:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soZtavUBVCiGjFdOWU=LChYs-yUX81LTr1Jqcj7CxHUtg@mail.gmail.com>
 <CAAnfSTuaWcDA66CA9reeST+2LBk1eqvccJEhjDRkjqeG0atKZw@mail.gmail.com>
In-Reply-To: <CAAnfSTuaWcDA66CA9reeST+2LBk1eqvccJEhjDRkjqeG0atKZw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 6 Apr 2021 16:18:15 -0700
Message-ID: <CAMKF1soP_O9CitKtwWB8ijiUchPfLhjmkAMri3WN=yeBjj3eqA@mail.gmail.com>
Subject: Re: [meta-arm] sbsa-acs failing to build for not qemuarm64 machines
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Thanks for fixing it Ross, now next issue is a gold linker crash seen
on qemuarm64 see

https://errors.yoctoproject.org/Errors/Details/575671/

perhaps someone in ARM toolchain team is interested to fix it

On Tue, Apr 6, 2021 at 2:43 AM Ross Burton <ross@burtonini.com> wrote:
>
> Patch incoming.
>
> Ross
>
> On Sat, 3 Apr 2021 at 01:19, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > https://errors.yoctoproject.org/Errors/Details/575311/
> > https://errors.yoctoproject.org/Errors/Details/575302/
> >
> > is this recipe aarch64 only? if so then it should appropriate
> > compatible_host
> >
> > 
> >
